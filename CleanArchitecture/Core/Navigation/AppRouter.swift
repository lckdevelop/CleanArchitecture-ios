import SwiftUI
import Combine

// 탭별 내비게이션 관리자
class TabNavigationManager<R: NavigationRoute>: NavigationManaging {
    
    var objectWillChange = ObservableObjectPublisher()
    
    @Published var routes: [R] = [] {
        didSet {
            print("Routes updated \(routes.count)")
            objectWillChange.send()
        }
    }
    
    func push(_ route: R) {
        routes.append(route)
    }
    
    func pop() {
        if !routes.isEmpty {
            routes.removeLast()
        }
    }
    
    func popToRoot() {
        routes.removeAll()
    }
}

// 앱 전체 라우팅을 관리하는 클래스
class AppRouter: ObservableObject {
    // 각 탭별 내비게이션 관리자
    @Published var cultureCenterNavigator = TabNavigationManager<CultureCenterRoute>()
    @Published var couponNavigator = TabNavigationManager<CouponRoute>()
    @Published var homeNavigator = TabNavigationManager<HomeRoute>()
    
    // 현재 선택된 탭
    @Published var selectedTab: MainTabType = .cultureCenter
    
    // 특정 탭으로 이동
    func switchTab(to tab: MainTabType) {
        selectedTab = tab
    }
    
    func navigate(_ action: NavigationAction, route: Any? = nil) {
        switch selectedTab {
        case .cultureCenter:
            performNavigation(action, route: route as? CultureCenterRoute, navigator: cultureCenterNavigator)
        case .coupon:
            performNavigation(action, route: route as? CouponRoute, navigator: couponNavigator)
        case .home:
            performNavigation(action, route: route as? HomeRoute, navigator: homeNavigator)
        }
    }
    
    private func performNavigation<R: NavigationRoute>(_ action: NavigationAction, route: R?, navigator: TabNavigationManager<R>) {
        switch action {
        case .push:
            if let route = route {
                navigator.push(route)
            }
        case .pop:
            navigator.pop()
            
        case .popToRoot:
            navigator.popToRoot()
            
        case .navigateToTab(let tab, let route):
            self.selectedTab = tab
            //self.navigateToTab(tab, route: route)
            
        }
    }
    
    // 다른 탭으로 이동하면서 특정 화면까지 이동 (unwind 기능)
    func navigateToTab(_ tab: MainTabType, route: Any? = nil) {
        
        self.selectedTab = tab
        
        // 해당 탭에 라우트 추가
        if let route = route {
            navigate(.push, route: route)
        }
        
    }
}
