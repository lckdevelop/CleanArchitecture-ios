//
//  SceneDelegate.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit
import SwiftUI
import Data
import Domain
import NetworkModule

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            let repository = HomeRepository(homeService: HomeService())
            let usecase = HomeUseCase(homeRepository: repository)
            let viewModel = HomeViewModel(homeUseCase: usecase)

            self.window = UIWindow(windowScene: windowScene)

//            let router = AppRouter()
//            
//            let homeScreen = HomeScreen(router: router, homeViewModel: viewModel)
//
//            let hostingController = UIHostingController(rootView: NavigationView { homeScreen })
//
//            self.window?.rootViewController = hostingController
//            self.window?.makeKeyAndVisible()
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

