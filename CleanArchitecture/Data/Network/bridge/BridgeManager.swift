//
//  BridgeManager.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/9/25.
//

import Foundation
import Combine

class BridgeManager: NSObject {
    static let shared = BridgeManager()
    var router: AppRouter?

    // 설정된 Router가 없다면 설정
    func setRouter(_ router: AppRouter) {
        if self.router !== router {
            self.router = router
        }
    }
    
    func checkBridgeMessage(cmd: BridgeCMD, params: [String: Any], callback: String) {
        let data = params
        print("bridge: code: [ \(cmd) ] , params: \(params), callback: \(callback)")
        
        switch cmd {
        case .NON_CMD:
            return
        case .BACK:
            router?.navigate(.pop)
        case .CLOSE:
            router?.navigate(.pop)
        case .CLOSE_ALL:
            router?.navigate(.popToRoot)
        case .MOVE_NATIVE:
            if let screenName = data["screenName"] as? String {
                moveNative(screenName: screenName, data:params, callback: callback)
            }
        case .OPEN_WEBVIEW:
            if let url = data["url"] as? String, let method = data["method"] as? String {
                var navigationAction: NavigationAction = .push
                
                if method == "P" {
                    navigationAction = .present
                }
                
                router?.navigate(navigationAction, route: HomeRoute.webViewExam(WebViewModel(url: url, method: method)))
            }
        }
    }
    
    func moveNative(screenName: String, data: [String: Any]?, callback: String?) {
        var navigationAction: NavigationAction = .push
        
        if let method = data?["method"] as? String {
            if method == "P" {
                navigationAction = .present
            }
        }
        
        switch NativeScreenName(rawValue: screenName) {
        case .home:
            router?.navigate(navigationAction, route: HomeRoute.homeScreen)
        case .cultureCenter:
            return
        case .coupon:
                router?.navigate(navigationAction, route: CouponRoute.couponScreen)
        case .NativePushScreen:
            router?.navigateToOtherView(navigationAction, nativeScreenName: .NativePushScreen, route: HomeRoute.NativePushScreen)
        case .NativePresentScreen:
            router?.navigateToOtherView(navigationAction, nativeScreenName: .NativePresentScreen, route: HomeRoute.NativePresentScreen)
        default:
            return
        }
    }

}

