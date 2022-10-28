//
//  SceneDelegate.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 27.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        //TabBarController().selectedIndex = 1 открывает сначала 2-ю вкладку (индексы начинаются с 0)
        window?.backgroundColor = .orange
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible() //делает окно видимым (обязательно)
        
    }
}

