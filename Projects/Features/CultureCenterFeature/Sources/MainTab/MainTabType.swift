//
//  MainTabType.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import Foundation

public enum MainTabType: String, CaseIterable {
    case cultureCenter
    case coupon
    
    public var title: String {
        switch self {
        case .cultureCenter:
            return "문화센터"
        case .coupon:
            return "쿠폰"
        }
    }
    
    public func imageName(selected: Bool) -> String {
        switch self {
        case .cultureCenter:
            "house"
        case .coupon:
            "ticket.fill"
        }
        
    }
}
