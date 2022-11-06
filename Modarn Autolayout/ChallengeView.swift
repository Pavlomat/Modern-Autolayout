//
//  ChallengeView.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class ChallengeView: UIView {
    
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
                  blueView.leadingAnchor.constraint(equalTo: 
//              layoutMarginsGuide.leadingAnchor),
//                  blueView.topAnchor.constraint(equalTo:
//              layoutMarginsGuide.topAnchor),
//                  blueView.bottomAnchor.constraint(equalTo:
//              layoutMarginsGuide.bottomAnchor),
//                  blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 25.0),
//                  redView.leadingAnchor.constraint(equalTo:
//              layoutMarginsGuide.leadingAnchor),
//                  redView.topAnchor.constraint(equalTo:
//              layoutMarginsGuide.topAnchor),
//                  redView.bottomAnchor.constraint(equalTo:
//                                                    layoutMarginsGuide.bottomAnchor), redView.widthAnchor.constraint(equalTo: blueView.widthAnchor)
                  
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
