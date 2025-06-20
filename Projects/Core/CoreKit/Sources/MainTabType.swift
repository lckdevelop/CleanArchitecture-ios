//
//  MainTabType.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import Foundation
import SwiftUI

public enum MainTabType: String, CaseIterable {
    case home
    case cultureCenter
    case coupon
    case permission
    
    public var title: String {
        switch self {
        case .home:
            return "홈"
        case .cultureCenter:
            return "문화센터"
        case .coupon:
            return "쿠폰"
        case .permission:
            return "OS권한"
        }
    }
    
    public func imageName(selected: Bool) -> String {
        switch self {
        case .home:
            "house.fill"
        case .cultureCenter:
            "bag.fill"
        case .coupon:
            "ticket.fill"
        case .permission:
            "lock.shield.fill"
        }
    }
}
