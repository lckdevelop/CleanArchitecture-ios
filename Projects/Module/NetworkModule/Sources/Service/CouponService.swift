//
//  CouponService.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/12/25.
//

import Foundation
import Combine
import Moya

public protocol CouponServiceProtocol {
    func fetchCouponList(couponRequest: CouponRequest) -> AnyPublisher<CouponListResponse, Error>
}

public final class CouponService: BaseService<HpointAPI>, CouponServiceProtocol {
    public func fetchCouponList(couponRequest: CouponRequest) -> AnyPublisher<CouponListResponse, Error> {
        requestObjectInCombine(.fetchCouponList(request: couponRequest))
    }
}
