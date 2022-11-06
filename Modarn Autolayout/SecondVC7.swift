//
//  SecondVC7.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class SecondVC7: UIViewController {
    
    private let mainImage: UIImageView = {
            let view = UIImageView(image: UIImage(named: "300x300"))
            view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
            view.setContentCompressionResistancePriority(.defaultHigh + 1, for: .horizontal)
            return view
        }()
    
    private let label: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.text = "A sunny day"
           label.font = UIFont.systemFont(ofSize: 64.0)
           label.backgroundColor = .yellow
           label.numberOfLines = 0
           return label
       }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
            view.addSubview(mainImage)
            view.addSubview(label)

            let margins = view.layoutMarginsGuide
        
            NSLayoutConstraint.activate([
                mainImage.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
                mainImage.topAnchor.constraint(equalTo: margins.topAnchor),

               label.leadingAnchor.constraint(equalToSystemSpacingAfter: mainImage.trailingAnchor, multiplier: 1.0), label.topAnchor.constraint(equalTo: margins.topAnchor),
                label.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
                ])
        }
}
