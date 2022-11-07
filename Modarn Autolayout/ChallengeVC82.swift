//
//  ChallengeVC72.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class ChallengeVC82: UIViewController {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "300x300")
        image.contentMode = .scaleToFill
        image.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        return image
    }()
    
    private let shareButton = customButton(title: "Share", color: .white)
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [imageView, shareButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = UIStackView.spacingUseSystem
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(stackView)
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: margins.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
    }
}

private extension UIViewController {
    static func customButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
//        button.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return button
    }
}

