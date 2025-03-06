//
//  NavigationProtocol.swift
//  CleanArchitecture
//
//  Created by 김서진 on 3/6/25.
//

import Foundation
import SwiftUI

enum NavigationAction {
    case push
    case pop
    case popToRoot
    case navigateToTab(MainTabType, Any?)
}

protocol NavigationRoute: Hashable {}

protocol NavigationManaging: ObservableObject {
    associatedtype Route: NavigationRoute
    
    var routes: [Route] { get set }
    
    func push(_ route: Route)
    func pop()
    func popToRoot()
}