//
//  RootViewController.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 27.10.2022.
//

import UIKit

class RootViewController: UIViewController {
    
    let padding: CGFloat = 50.0
    
   private let greenView: UIView = {
            let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.backgroundColor = .green
//       view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
            return view
        }()
    
    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
//        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() { //called before the view controller’s view starts to layout its subviews, все расчеты с view делается в этом методе
        
        if greenView.superview == nil { //проверка, если зеленый вью еще не был добавлен на экран, то...
            view.addSubview(greenView)
        }
        
        if redView.superview == nil { //проверка, если зеленый вью еще не был добавлен на экран, то...
            view.addSubview(redView)
        }
    }
    
    override func viewDidLayoutSubviews() { //рисует вьюшки уже после их появления на главном экране
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            
            redView.heightAnchor.constraint(equalToConstant: 100.0),
            redView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 25.0),
            redView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -25.0),
            redView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
