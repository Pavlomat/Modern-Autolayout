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
            blueView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            blueView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            blueView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor, constant: padding),
            redView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            redView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            redView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding), redView.widthAnchor.constraint(equalTo: blueView.widthAnchor)])
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
