//
//  ChallengeVC72.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class ChallengeVC72: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To be or not to be, that is the question"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24.0)
        label.backgroundColor = .purple
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultLow - 1, for: .horizontal)
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        config.title = "Share"
        config.subtitle = "Anything"
        config.baseBackgroundColor = .yellow
        config.baseForegroundColor = .black
        config.cornerStyle = .dynamic
        config.image = UIImage(systemName: "car", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        config.imagePlacement = .trailing
        config.imagePadding = 10.0
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Share", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 24.0)
//        button.backgroundColor = .yellow
//        button.tintColor = .black
//        button.layer.cornerRadius = 5
//        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
//        button.setContentHuggingPriority(.defaultLow + 1, for: .horizontal) //или через label
        button.setContentCompressionResistancePriority(.defaultHigh + 1, for: .horizontal) //
        
        button.configuration = config
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(label)
        view.addSubview(button)
        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: margins.topAnchor),
            button.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            
            label.topAnchor.constraint(equalTo: margins.topAnchor),
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: button.trailingAnchor, multiplier: 1.0)
        ])
    }
}
