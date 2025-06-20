//
//  RoutingProtocol.swift
//  CoreKit
//
//  Created by Chaekyeong Lee on 4/5/25.
//

import Foundation

// AppRouter를 전역적으로 사용하기 위해 Protocol 선언
public protocol RoutingProtocol: AnyObject {
    func navigate(_ action: NavigationAction, route: Any?)
    func navigateToOtherView(_ action: NavigationAction, nativeScreenName: NativeScreenName, route: Any?)
    func navigateToTab(_ tab: MainTabType, route: Any?)
    func switchTab(to tab: MainTabType)
    func presentModal()
    func dismissModal()
}
