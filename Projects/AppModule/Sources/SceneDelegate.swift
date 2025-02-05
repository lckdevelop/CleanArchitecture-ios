//
//  SceneDelegate.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit
import SwiftUI
import Domain
import Data
import RootFeature

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var rootController: UINavigationController {
        return self.window!.rootViewController as? UINavigationController ?? UINavigationController(rootViewController: UIViewController())
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        
        let rootViewController = ViewControllerFactory.shared.makeMainTabVC()
        self.window?.rootViewController = UIHostingController(rootView: rootViewController)
        self.window?.makeKeyAndVisible()
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

