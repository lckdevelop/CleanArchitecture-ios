//
//  MockRouter.swift
//  HomeFeatureDemo
//
//  Created by Chaekyeong Lee on 4/6/25.
//

import Foundation
import CoreKit

class MockRouter: RoutingProtocol {
    func switchTab(to tab: CoreKit.MainTabType) {
        print("switchTab")
    }
    
    func navigate(_ action: NavigationAction, route: Any?) {
        print("[MockRouter] navigate: \(action), route: \(String(describing: route))")
    }

    func navigateToTab(_ tab: MainTabType, route: Any?) {
        print("[MockRouter] navigateToTab: \(tab), route: \(String(describing: route))")
    }

    func navigateToOtherView(_ action: NavigationAction, nativeScreenName: NativeScreenName, route: Any?) {
        print("[MockRouter] navigateToOtherView: \(nativeScreenName), route: \(String(describing: route))")
    }

    func presentModal() {
        print("[MockRouter] presentModal")
    }

    func dismissModal() {
        print("[MockRouter] dismissModal")
    }
}
