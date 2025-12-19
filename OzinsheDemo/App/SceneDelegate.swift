//
//  SceneDelegate.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 06.12.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var userX = User()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        // TODO: user login function implementation
//        if (userX.loggedIn == false) {
//            window?.rootViewController = UINavigationController(rootViewController: OnboardingViewController())
//        } else {
//            window?.rootViewController = UINavigationController(rootViewController: TabBarViewController())
//        }
        window?.rootViewController = UINavigationController(rootViewController: OnboardingViewController())

        
        window?.makeKeyAndVisible()
    }

}

