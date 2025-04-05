//
//  TabNavigationManager.swift
//  RootFeature
//
//  Created by Chaekyeong Lee on 4/2/25.
//

import Foundation
import Combine
import CoreKit

// 탭별 내비게이션 관리자 (단일 경로 관리)
public class TabNavigationManager<R: NavigationRoute>: NavigationManaging {
    public init() {}
    public var objectWillChange = ObservableObjectPublisher()
    
    // 단일 경로 스택 (모든 iOS 버전용)
    @Published public var routes: [R] = [] {
        didSet {
            print("Routes updated: \(routes.count)")
            objectWillChange.send()
        }
    }
    
    public func push(_ route: R) {
        print("Pushing route: \(route)")
        routes.append(route)
    }
    
    public func pop() {
        if !routes.isEmpty {
            routes.removeLast()
        }
    }
    
    public func popToRoot() {
        routes.removeAll()
    }
    
    public func present(_ route: R) {
        print("Present route: \(route)")
        routes.append(route)
    }
    
    public func dismiss() {
        if !routes.isEmpty {
            routes.removeLast()
        }
    }
    
}
