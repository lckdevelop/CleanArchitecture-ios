//
//  MainTabCoordinator.swift
//  CleanArchitecture
//
//  Created by 김서진 on 2/16/25.
//

import UIKit
import SwiftUI

protocol MainTabCoordinator: Coordinator {
    var tabBarController: UITabBarController { get }
}

class DefaultTabCoordinator: MainTabCoordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }
    
    // 메인 탭바 flow 시작
    func start() {
        let mainTabViewController = ViewControllerFactory.shared.makeMainTabVC()
        let hostingController = UIHostingController(rootView: mainTabViewController)

        navigationController.pushViewController(hostingController, animated: false)
        tabBarController.viewControllers = [navigationController] // tabBar에 네비게이션 컨트롤러 추가
    }
    
    // MARK: TODO 코디네이터가 종료되었을때 처리
    func finish() {
        
    }

}
