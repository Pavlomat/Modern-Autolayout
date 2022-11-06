//
//  FirstVC7.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class FirstVC7: UIViewController {
    
    private let smallView = UIImageView(named: "100x100")
    private let largeView = UIImageView(named: "300x300")
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This label should be below the tallest of the two images"
        label.font = UIFont.systemFont(ofSize: 32.0)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(smallView)
        view.addSubview(largeView)
        view.addSubview(captionLabel)
        
        let margins = view.layoutMarginsGuide
        
        let captionTopConstraint = captionLabel.topAnchor.constraint(equalTo: margins.topAnchor)
        captionTopConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            smallView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            smallView.topAnchor.constraint(equalTo: margins.topAnchor),
            largeView.topAnchor.constraint(equalTo: margins.topAnchor),
            largeView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            captionLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            captionLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            captionLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: smallView.bottomAnchor, multiplier: 1.0),
            captionLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: largeView.bottomAnchor, multiplier: 1.0),
            captionTopConstraint
        ])
    }
    
    
}

private extension UIImageView {
    convenience init(named name: String) {
        self.init(image: UIImage(named: name))
        translatesAutoresizingMaskIntoConstraints = false
    } }
