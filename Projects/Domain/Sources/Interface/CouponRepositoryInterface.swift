//
//  CouponRepositoryInterface.swift
//  Domain
//
//  Created by Chaekyeong Lee on 3/30/25.
//

import Foundation
import Combine

public protocol CouponRepositoryInterface {
    func fetchCoupons(couponRequestDTO: CouponRequestDTO) -> AnyPublisher<[CouponEntity], Error>
}
