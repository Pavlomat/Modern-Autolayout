//
//  TabBarController.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 28.10.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        view.backgroundColor = .white //уровень цвета 2
        UITabBar.appearance().barTintColor = .red
        tabBar.tintColor = .purple
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: FirstVC7(), title: NSLocalizedString("First", comment: ""), image: UIImage(systemName: "1.circle")!),
            createNavController(for: SecondVC7(), title: NSLocalizedString("Second", comment: ""), image: UIImage(systemName: "2.circle")!)
//            createNavController(for: EqualSpacingVC(), title: NSLocalizedString("Third", comment: ""), image: UIImage(systemName: "3.circle")!),
//            createNavController(for: ChallengeVC(), title: NSLocalizedString("Fourth", comment: ""), image: UIImage(systemName: "4.circle")!)
        ]
    }
}
