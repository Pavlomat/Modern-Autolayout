//
//  ThirdVC8.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 07.11.2022.
//

import UIKit

class ThirdVC8: UIViewController {
    
    private let firstImage = createImageView(image: "300x300")
    private let secondImage = createImageView(image: "300x300")
    private let thirdImage = createImageView(image: "300x300")
    
    private lazy var insideStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [firstImage, secondImage, thirdImage])
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = UIStackView.spacingUseSystem
        return view
    }()
    
    private lazy var switchButton: UISwitch = {
        let button = UISwitch()
        button.isOn = true
        button.addTarget(self, action: #selector(axisChanged(_:)), for: .valueChanged)
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [switchButton, insideStackView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 16
        view.backgroundColor = .purple
        view.layer.cornerRadius = 10
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    setupView()
    configureAxis()
    }
    
    private func setupView() {
        view.addSubview(mainStackView)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        let margin = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: margin.centerXAnchor),
            mainStackView.topAnchor.constraint(equalTo: margin.topAnchor)
        ])
    }
    

    @objc private func axisChanged(_ sender: UISwitch) {
        if #available(iOS 10, *) {
            let animator = UIViewPropertyAnimator(duration: 2.0, dampingRatio: 0.2, animations: {
                self.configureAxis()
            })
            animator.startAnimation()
        } else {
            UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [], animations: {
                self.configureAxis()
            }, completion: nil)
        }
    }
    
    private func configureAxis() {
        insideStackView.axis = switchButton.isOn ? .vertical : .horizontal
        
        if let lastImageView = insideStackView.arrangedSubviews.last {
            lastImageView.isHidden = !switchButton.isOn
       }
    }

}

private extension UIViewController {
    static func createImageView(image: String) -> UIImageView {
       let view = UIImageView()
        view.image = UIImage(named: image)
        view.contentMode = .scaleAspectFit
        return view
    }
}
