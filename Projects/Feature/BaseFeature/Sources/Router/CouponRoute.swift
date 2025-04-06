//
//  CouponRoute.swift
//  CleanArchitecture
//
//  Created by 김서진 on 3/6/25.
//

import Foundation
import Domain
import CoreKit

// 쿠폰 라우트
public enum CouponRoute: NavigationRoute {
    // 필요한 경로 추가
    case couponScreen
    case couponDetail(CouponEntity)
}
