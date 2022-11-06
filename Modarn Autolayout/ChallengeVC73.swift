//
//  ChallengeVC73.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class ChallengeVC73: UIViewController {
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .yellow
        view.addSubview(greenView)
        
        let topAnchor = greenView.topAnchor.constraint(equalTo: view.topAnchor)
        topAnchor.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greenView.heightAnchor.constraint(equalTo: greenView.widthAnchor, multiplier: 1.0/1.0),
            greenView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
            
            topAnchor
            
        ])
    }

}
