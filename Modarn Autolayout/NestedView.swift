//
//  NestedView.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 28.10.2022.
//

import UIKit

class NestedView: UIView {
    
    var nestedColor: UIColor = .green {
        didSet {
              nestedView.backgroundColor = nestedColor
            }
    }
    
    private lazy var nestedView: UIView = {
    let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = nestedColor
    return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        addSubview(nestedView)
        NSLayoutConstraint.activate([
                  nestedView.leadingAnchor.constraint(equalTo:
              layoutMarginsGuide.leadingAnchor),
                  nestedView.topAnchor.constraint(equalTo:
              layoutMarginsGuide.topAnchor),
                  nestedView.trailingAnchor.constraint(equalTo:
              layoutMarginsGuide.trailingAnchor),
                  nestedView.bottomAnchor.constraint(equalTo:
             layoutMarginsGuide.bottomAnchor)
       ])
    }
}
