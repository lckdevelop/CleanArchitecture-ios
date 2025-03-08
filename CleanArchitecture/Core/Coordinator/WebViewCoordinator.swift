//
//  WebViewCoordinator.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import SwiftUI
import UIKit


class WebViewCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func finish() {
        
    }
    

}
