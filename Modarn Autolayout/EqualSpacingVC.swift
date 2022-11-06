//
//  EqualSpacingVC.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 31.10.2022.
//

import UIKit

class EqualSpacingVC: UIViewController {
    
    private lazy var cancelButton: UIButton = {
           let title = NSLocalizedString("Cancel", comment: "Cancel button")
        let button = UIButton.customButton(title: title, titleColor: .white, tintColor: .orange, backgroundColor: .red)
           button.addTarget(self, action: #selector(cancelAction(_:)), for: .touchUpInside)
           return button
       }()

       private lazy var okButton: UIButton = {
           let title = NSLocalizedString("OK", comment: "OK buton")
           let button = UIButton.customButton(title: title, titleColor: .white, tintColor: .orange, backgroundColor: .green)
           button.addTarget(self, action: #selector(okAction(_:)), for: .touchUpInside)
           return button
       }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    @objc private func cancelAction(_ sender: UIButton) {
            print("Cancel")
        }

        @objc private func okAction(_ sender: UIButton) {
            print("OK")
        }
    
    private func setupView() {
        view.addSubview(cancelButton)
        view.addSubview(okButton)
        
        let leadingGuide = UILayoutGuide()  //создается для равных промежутков между элементами
        let middleGuide = UILayoutGuide()   //аналогично
        let trailingGuide = UILayoutGuide() //аналогично
        
        view.addLayoutGuide(leadingGuide)   //лейаут гайды как и другие гайды не часть вью поэтому добавляются не через addSubview а через addLayoutGuide
        view.addLayoutGuide(middleGuide)
        view.addLayoutGuide(trailingGuide)
        
        NSLayoutConstraint.activate([

                    view.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor),
                    leadingGuide.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor),

                    cancelButton.trailingAnchor.constraint(equalTo: middleGuide.leadingAnchor),
                    middleGuide.trailingAnchor.constraint(equalTo: okButton.leadingAnchor),

                    okButton.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor),
                    trailingGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),

                    cancelButton.widthAnchor.constraint(equalTo: okButton.widthAnchor),
                    leadingGuide.widthAnchor.constraint(equalTo: middleGuide.widthAnchor),
                    leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor),

                    cancelButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                    okButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
                    ])
    }

}

extension UIButton {
    static func customButton(title: String, titleColor: UIColor, tintColor: UIColor, backgroundColor: UIColor) -> UIButton {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button.backgroundColor = backgroundColor
        button.tintColor = tintColor
        button.layer.cornerRadius = 5
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        return button
    }
}
