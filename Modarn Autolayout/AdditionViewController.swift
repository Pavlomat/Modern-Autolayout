//
//  AdditionViewController.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 27.10.2022.
//

import UIKit

class AdditionViewController: UIViewController {

    let padding: CGFloat = 20.0
   
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        return view
    }()
    
   private let greenView: UIView = {
            let view = UIView()
       view.backgroundColor = .green
       view.translatesAutoresizingMaskIntoConstraints = false
//       view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
            return view
        }()

    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() { //called before the view controller’s view starts to layout its subviews, все расчеты с view делается в этом методе
        
        if redView.superview == nil { //проверка, если зеленый вью еще не был добавлен на экран, то...
            view.addSubview(redView)
        }
        
        if greenView.superview == nil { //проверка, если зеленый вью еще не был добавлен на экран, то...
            view.addSubview(greenView)
        }
        
        if blueView.superview == nil { //проверка, если зеленый вью еще не был добавлен на экран, то...
            view.addSubview(blueView)
        }
    }
    
    override func viewDidLayoutSubviews() { //рисует вьюшки уже после их появления на главном экране
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: padding),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            blueView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: padding),
            blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            greenView.heightAnchor.constraint(equalTo: redView.heightAnchor),
            blueView.heightAnchor.constraint(equalTo: redView.heightAnchor)
        ])
    }
}
