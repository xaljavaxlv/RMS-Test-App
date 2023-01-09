//
//  SceneDelegate.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/6/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow.init(windowScene: windowScene)
        let homeVCNavigation = UINavigationController(rootViewController: ScreenBuilder.screateHome())
        let myAccountVCNavigation = UINavigationController(rootViewController: ScreenBuilder.createMyAccount())
        let settingsVCNavigation = UINavigationController(rootViewController: ScreenBuilder.createSettings())
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([homeVCNavigation, myAccountVCNavigation, settingsVCNavigation], animated: true)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        guard let items = tabBarController.tabBar.items else { return }
        items[0].title = "Home"
        items[1].title = "My Account"
        items[2].title = "Settings"
    }
}

