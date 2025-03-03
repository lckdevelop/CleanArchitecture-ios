//
//  SceneDelegate.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit
import SwiftUI
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            DIContainer.shared.registerDependencies()

            self.window = UIWindow(windowScene: windowScene)

            let navigationController = UINavigationController()
            
            let appCoordinator = AppCoordinator(navigationController: navigationController)
            appCoordinator.start()

            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

