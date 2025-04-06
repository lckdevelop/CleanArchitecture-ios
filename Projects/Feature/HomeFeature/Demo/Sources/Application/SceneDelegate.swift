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

public class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    public var window: UIWindow?

    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            let repository = HomeRepository(homeService: HomeService())
            let usecase = HomeUseCase(homeRepository: repository)
            let viewModel = HomeViewModel(homeUseCase: usecase)

            self.window = UIWindow(windowScene: windowScene)

            let router = MockRouter()
            
            let homeScreen = HomeScreen(router: router, homeViewModel: viewModel)

            let hostingController = UIHostingController(rootView: NavigationView { homeScreen })

            self.window?.rootViewController = hostingController
            self.window?.makeKeyAndVisible()
        }
    }

    public func sceneDidDisconnect(_ scene: UIScene) {

    }

    public func sceneDidBecomeActive(_ scene: UIScene) {

    }

    public func sceneWillResignActive(_ scene: UIScene) {

    }

    public func sceneWillEnterForeground(_ scene: UIScene) {

    }

    public func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

