//
//  FirstVC7.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class FirstVC8: UIViewController {
    
    private enum ViewMetrics {
        static let fontSize: CGFloat = 24.0
        static let spacing: CGFloat = 16.0
    }
    
    private let redButton = UIButton.customButton(title: "Red", color: .red, fontSize: ViewMetrics.fontSize)
    private let greenButton = UIButton.customButton(title: "Green", color: .green, fontSize: ViewMetrics.fontSize)
    private let blueButton = UIButton.customButton(title: "Blue", color: .blue, fontSize: ViewMetrics.fontSize)
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton])
        stackView.spacing = ViewMetrics.spacing
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal //стаквью по-умолчанию горизонтальный поэтому .horizontal писать необязательно
        return stackView
    }()
    
    private let colorLabel: UILabel = {
        let label = UILabel()
        label.text = "Pick a color"
        label.font = UIFont.systemFont(ofSize: ViewMetrics.fontSize)
        return label
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [colorLabel, buttonStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false //пишется только для внешнего стаквью тк внутри стаквью поумолчанию все элементы translatesAutoresizingMaskIntoConstraints = false (в нашем случае 3 кнопки, стаквью с ними и лейбл)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = ViewMetrics.spacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(rootStackView)
        
//        // Add to subviews
//          stackView.addSubview(redButton) ВАЖНО addsubview просто добавляет вью к стаквью но не дает ему констранты и лейаут портится
//          // Add to arrangedSubviews and subviews
//          stackView.addArrangedSubview(redButton) ВАЖНО это правильное добавление вью к стаквью, так добавляются констранты и лейаут не портится
        // чтобы убрать oneView из стаквью морально и физически нужно написать oneView.removeFromSuperview()
        // можно делать разное расстояние между разными элементами стаквью но только в коде - stackView.setCustomSpacing(32.0, after: headerLabel)
        // stackView.isBaselineRelativeArrangement = true для какого-то расстояния в вертикальном стаквью где только текст
        
//        stackView.isLayoutMarginsRelativeArrangement = true ЧТОБЫ добавить марджина, поумолчанию они отключены
//        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        
        NSLayoutConstraint.activate([
            rootStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            rootStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    
}

private extension UIButton {
    static func customButton(title: String, color: UIColor, fontSize: CGFloat) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        return button
    }
}
