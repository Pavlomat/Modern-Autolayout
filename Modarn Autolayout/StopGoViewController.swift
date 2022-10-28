//
//  StopGoViewController.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 28.10.2022.
//

import UIKit

class StopGoViewController: UIViewController {
    
    private let stopGoView: StopGoView = {
    let view = StopGoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
    return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        view.backgroundColor = .yellow //дублируется в этом случае, тк в sceneDelegate написано тоже самое
        view.addSubview(stopGoView)
            
        NSLayoutConstraint.activate([
              stopGoView.leadingAnchor.constraint(equalTo:
          view.leadingAnchor),
              stopGoView.topAnchor.constraint(equalTo:
          view.topAnchor),
              stopGoView.trailingAnchor.constraint(equalTo:
          view.trailingAnchor),
              stopGoView.bottomAnchor.constraint(equalTo:
          view.bottomAnchor)
        ]) }
}
