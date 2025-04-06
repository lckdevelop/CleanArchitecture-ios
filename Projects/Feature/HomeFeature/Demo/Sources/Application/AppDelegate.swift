//
//  AppDelegate.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit
import SwiftUI
import Data
import Domain
import NetworkModule

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

       func application(
           _ application: UIApplication,
           didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
       ) -> Bool {
           let repository = HomeRepository(homeService: HomeService())
           let usecase = HomeUseCase(homeRepository: repository)
           let viewModel = HomeViewModel(homeUseCase: usecase)

           let router = MockRouter()
           let rootView = NavigationView {
               HomeScreen(router: router, homeViewModel: viewModel)
           }
           //let homeScreen = HomeScreen(router: router, homeViewModel: viewModel)

           let window = UIWindow(frame: UIScreen.main.bounds)
           window.rootViewController = UIHostingController(rootView: rootView)
           self.window = window
           window.makeKeyAndVisible()

           return true
       }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)

    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }


}

