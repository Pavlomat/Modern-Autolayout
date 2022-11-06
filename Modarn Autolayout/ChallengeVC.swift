//
//  ChallengeVC.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class ChallengeVC: UIViewController {
    
    private let margin: CGFloat = 50.0
    
    private let challengeView: ChallengeView = {
        let view = ChallengeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.preservesSuperviewLayoutMargins = true //чтобы соблюдать дополнительные марджины супервью
        view.backgroundColor = .green
        return view
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        view.backgroundColor = .yellow
        view.addSubview(challengeView)
        
        NSLayoutConstraint.activate([
            challengeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            challengeView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: margin),
            challengeView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -margin),
            challengeView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
    }

}
