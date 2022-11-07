//
//  SecondVC7.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class SecondVC11: UIViewController {
    
    private let topImage = makeImageView(name: "100image")
    private let middleImage = makeImageView(name: "100image")
    private let bottomImage = makeImageView(name: "100image")
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topImage, middleImage, bottomImage])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .cyan
        
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: stackView.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            scrollView.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
}

private extension UIViewController {
    static func makeImageView(name: String) -> UIImageView {
        let view = UIImageView()
        view.image = UIImage(named: name)
        view.contentMode = .scaleAspectFit
        return view
    }
}


