//
//  NavigationProtocol.swift
//  CleanArchitecture
//
//  Created by 김서진 on 3/6/25.
//

import Foundation
import SwiftUI
import TabViewFeature

public enum NavigationAction {
    case push
    case pop
    case popToRoot
    case present
    case navigateToTab(MainTabType, Any?)
}

public protocol NavigationRoute: Hashable {}

public protocol NavigationManaging: ObservableObject {
    associatedtype Route: NavigationRoute
    
    var routes: [Route] { get set }
    
    func push(_ route: Route)
    func pop()
    func popToRoot()
    func present(_ route: Route)
    func dismiss()
}
