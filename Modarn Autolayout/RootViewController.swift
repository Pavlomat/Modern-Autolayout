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
        let view = TileView()
        view.backgroundColor = .green
        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin] //это красненькие стрелочки для направления изменения величины растяжения
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupView()
    }
    
    override func viewWillLayoutSubviews() { //called before the view controller’s view starts to layout its subviews, все расчеты с view делается в этом методе
        if greenView.superview == nil { //проверка, если зеленый вью еще не был добавлен на экран, то...
            view.addSubview(greenView)
            let width = view.bounds.width - 2 * padding
            greenView.frame = CGRect(x: padding, y: padding, width: width, height: 3 * padding)
        }
    }
    
//    func setupView() {
//        greenView.translatesAutoresizingMaskIntoConstraints = false //ОБЯЗАТЕЛЬНО пишется для того, чтобы XCode сам не создавал констрейнтс для созданных в коде view и далее мы сами делаем констрейнты для созданного в коде view
        
//        NSLayoutConstraint.activate([
//            greenView.topAnchor.constraint(equalTo: view.topAnchor),
//            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 5% radius
        let radius = greenView.bounds.width / 20
        greenView.layer.cornerRadius = radius
    }
}
