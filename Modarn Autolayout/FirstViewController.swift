//
//  FirstViewController.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 28.10.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let externalPadding: CGFloat = 50.0
      private let internalSpacing: CGFloat = 25.0

      private let redView = UIView.makeView(color: .red)
      private let greenView = UIView.makeView(color: .green)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
//    let guide = view.safeAreaLayoutGuide располагает наш вью относительно safe area
//    redView.leadingAnchor.constraint(equalTo: guide.leadingAnchor)
//    redView.trailingAnchor.constraint(equalTo: guide.trailingAnchor)
    
//    additionalSafeAreaInsets = UIEdgeInsets(top: toolbarHeight, left: 0, bottom: 0, right: 0) так мы подгоняем лейаут под наш кастомный тулбар сверху

    private func setupView() {
//            view.backgroundColor = .yellow    //уровень цвета 3
            view.addSubview(redView)
            view.addSubview(greenView)

            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                redView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: externalPadding),
                greenView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: externalPadding),

                guide.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: externalPadding),
                guide.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: externalPadding),

                redView.topAnchor.constraint(equalTo: guide.topAnchor, constant: externalPadding),
                greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: internalSpacing),

                guide.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: externalPadding),

                redView.heightAnchor.constraint(equalTo: greenView.heightAnchor)
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
