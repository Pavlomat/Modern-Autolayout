//
//  FirstVC7.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class FirstVC11: UIViewController {
    
    private let activityView: ActivityView = {
        let view = ActivityView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(activityView)
        return scrollView
    }()
    
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .infoDark)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showInfo(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.tintColor = .black
        //        title = NSLocalizedString("Activity", comment: "")
        setupView()
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(infoButton)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: activityView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: activityView.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: activityView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: activityView.bottomAnchor),
            
            scrollView.widthAnchor.constraint(equalTo: activityView.widthAnchor),
            
            infoButton.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor), //тк если просто добавлять то скроется за нави бар или будет скролиться верх вниз
            infoButton.topAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.topAnchor)
        ])
    }
    
    @objc func showInfo(_ sender: UIButton) {
        print("Hello")
    }
}
