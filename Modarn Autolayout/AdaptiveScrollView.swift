//
//  AdaptiveScrollView.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 07.11.2022.
//

import UIKit

final class AdaptiveScrollView: UIScrollView { //чтобы при воявлении клавиатуры наш скрол вью под нее подстраивался

    override init(frame: CGRect) {
           super.init(frame: frame)
           setup()
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setup()
       }

       private func setup() {
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
       }

       @objc private func keyboardDidShow(_ notification: Notification) {
           guard let userInfo = notification.userInfo,
               let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
               return
           }

           let keyboardSize = keyboardFrame.cgRectValue.size
           let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
           adjustContentInsets(contentInsets)
       }

       @objc private func keyboardWillHide(_ notification: Notification) {
           adjustContentInsets(.zero)
       }

       private func adjustContentInsets(_ contentInsets: UIEdgeInsets) {
           contentInset = contentInsets
           scrollIndicatorInsets = contentInsets
       }
   }
