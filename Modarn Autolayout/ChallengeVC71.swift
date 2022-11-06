//
//  ChallengeVC7.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class ChallengeVC71: UIViewController {
    
    private let leftLabel = makeLabel(text: "William Shakespeare", textColor: .black, color: .yellow)
    private let rightLabel = makeLabel(text: "To be or not to be, that is the question", textColor: .white, color: .purple)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(leftLabel)
        view.addSubview(rightLabel)
        
        let margins = view.layoutMarginsGuide
        
        let rightLabelWidth = rightLabel.widthAnchor.constraint(equalTo: leftLabel.widthAnchor, multiplier: 2.0)
        rightLabelWidth.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            leftLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            leftLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            
            rightLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            rightLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            rightLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leftLabel.trailingAnchor, multiplier: 1.0),
            
            leftLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 160.0),
            rightLabelWidth
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
        label.numberOfLines = 0
        return label
    }
}
