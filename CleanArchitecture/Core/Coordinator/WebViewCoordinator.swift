//
//  WebViewCoordinator.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import SwiftUI
import UIKit


class WebViewCoordinator: Coordinator {

    
    var parentCoordinator: DefaultTabCoordinator
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(parentCoordinator: DefaultTabCoordinator) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = parentCoordinator.navigationController
        parentCoordinator.childCoordinators.append(self)
    }
    
    func start() {
        
    }
    
    func finish() {
        
    }
    
    func trendDetail(page: Page) {
        //super.push(page: page)
//        if self.navigationController == nil {
//            print("navigationController is nil")
//            return
//        }

        let hostingController = UIHostingController(rootView: TestView())
        self.navigationController.pushViewController(hostingController, animated: false)
        //push(
    }
}
