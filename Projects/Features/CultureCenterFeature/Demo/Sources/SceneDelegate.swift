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
import CultureCenterFeature

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var rootController: UINavigationController {
        return self.window!.rootViewController as? UINavigationController ?? UINavigationController(rootViewController: UIViewController())
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(windowScene: scene)
        
        let repository = DefaultCultureSearchResultRepository(cultureSearchService: CultureSearchService.shared)
        let usecase = DefaultCultureSearchListUseCase(repository: repository)
        let viewModel = DefaultLectureSearchResultViewModel(fetchCultureSearchUsecase: usecase)
        let rootViewController = LectureResultViewController(viewModel: viewModel)
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        self.window?.rootViewController = navigationController
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

