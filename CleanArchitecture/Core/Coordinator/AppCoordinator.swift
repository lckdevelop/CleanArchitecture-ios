//
//  AppCoordinator.swift
//  CleanArchitecture
//
//  Created by 김서진 on 2/16/25.
//

import UIKit
import SwiftUI

/**
 앱의 전체 흐름을 제어하게 될 최상위 Coordinator인 AppCoordinator
 하나의 ViewController 가 하나의 Coordinator 를 가지는게 아니라, 하나의 Coordinator가 관련된 ViewController 여러 개를 관리하게 합니다.
 🚨 ViewController 가 화면을 전환하는 책임이 없도록 합니다.
 
 1. 앱이 시작되면 SceneDelegate 에 의해 AppCoordinator 가 start 됩니다
 2. MainTabCoordinator 가 실행됩니다
 */
public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set } // 하위 Coordinator들을 저장하는 배열
    var navigationController: UINavigationController { get set } // 현재 Coordinator에서 사용할 NavigationController
    
    func start() // coordinator 시작
    func finish() // coordinator 종료
}

class AppCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let mainTabCoordinator = DefaultTabCoordinator(navigationController: navigationController)
        childCoordinators.append(mainTabCoordinator)
        mainTabCoordinator.start()
    }
    
    // MARK: TODO 코디네이터가 종료되었을때 처리
    func finish() {
        
    }
    
}
