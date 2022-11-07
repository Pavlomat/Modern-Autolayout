//
//  ChallengeVC7.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class ChallengeVC81: UIViewController {
    
    private let label = makeLabel(text: "Engine Power", textColor: .black, color: .white)
    private let lowButton = customButton(title: "Low", color: .red)
    private let mediumButton = customButton(title: "Medium", color: .yellow)
    private let highButton = customButton(title: "High", color: .green)

    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [label, lowButton, mediumButton, highButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .vertical
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
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
    }
    
}

private extension UIViewController {
    static func makeLabel(text: String, textColor: UIColor, color: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.systemFont(ofSize: 24.0)
        label.textColor = textColor
        label.backgroundColor = color
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    
    static func customButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }
}
