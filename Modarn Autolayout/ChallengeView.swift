//
//  ChallengeView.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class ChallengeView: UIView {
    
    private let padding: CGFloat = 25.0
    
    private let blueView = makeView(color: .blue)
    private let redView = makeView(color: .red)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        
        addSubview(blueView)
        addSubview(redView)
        
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: padding),
            blueView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: padding),
            blueView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -padding),
            redView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: padding),
            redView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -padding),
            redView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -padding),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -padding),
            blueView.widthAnchor.constraint(equalTo: redView.widthAnchor)
        ])
    }
    
}

private extension UIView {
    static func makeView(color: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }
}
