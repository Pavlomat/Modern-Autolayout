//
//  SecondViewController.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 28.10.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let margin: CGFloat = 50.0
    
    private let nestedView: NestedView = {
        let view = NestedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.preservesSuperviewLayoutMargins = true //чтобы соблюдать дополнительные марджины супервью
        view.backgroundColor = .red
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .yellow
        view.addSubview(nestedView)
        changeNestedMargins(inset: margin) //это если требуется изменить layout margins
//        nestedView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin) или пишется как сверху но уже с поддержкой ios 10,9 и пр
        
        NSLayoutConstraint.activate([
            nestedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nestedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nestedView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            nestedView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    private func changeNestedMargins(inset: CGFloat) {
        if #available(iOS 11, *) {
            nestedView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        } else {
            nestedView.layoutMargins = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        }
    }
}
