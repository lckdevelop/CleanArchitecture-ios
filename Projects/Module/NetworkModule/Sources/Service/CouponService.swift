//
//  CouponService.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/12/25.
//

import Foundation
import Combine
import Moya
import Domain

public protocol CouponServiceProtocol {
    func fetchCouponList(request: CouponRequestDTO) -> AnyPublisher<CouponEntityList, Error>
}

public final class CouponService: BaseService<HpointAPI>, CouponServiceProtocol {
    public func fetchCouponList(request: CouponRequestDTO) -> AnyPublisher<CouponEntityList, Error> {
        requestObjectInCombine(.fetchCouponList(request: request))
    }
}
