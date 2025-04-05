//
//  FeatureRouter.swift
//  BaseFeature
//
//  Created by Chaekyeong Lee on 4/3/25.
//

import SwiftUI
import CoreKit

public protocol FeatureRouterProtocol {
    func switchTab(to tab: MainTabType)
    func navigate(_ action: NavigationAction, route: Any?)
    func navigateToTab(_ tab: MainTabType, route: Any?)
    func navigateToOtherView(_ action: NavigationAction, nativeScreenName: NativeScreenName, route: Any?)
    func presentModal()
    func dismissModal()
}

public class FeatureRouter: FeatureRouterProtocol {

    private let appRouter: RoutingProtocol

    public init(appRouter: RoutingProtocol) {
        self.appRouter = appRouter
    }

    public func switchTab(to tab: MainTabType) {
        appRouter.switchTab(to: tab)
    }

    public func navigate(_ action: NavigationAction, route: Any?) {
        appRouter.navigate(action, route: route)
    }

    public func navigateToTab(_ tab: MainTabType, route: Any?) {
        appRouter.navigateToTab(tab, route: route)
    }

    public func navigateToOtherView(_ action: NavigationAction, nativeScreenName: NativeScreenName, route: Any?) {
        appRouter.navigateToOtherView(action, nativeScreenName: nativeScreenName, route: route)
    }

    public func presentModal() {
        appRouter.presentModal()
    }

    public func dismissModal() {
        appRouter.dismissModal()
    }
}

