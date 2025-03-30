//
//  CouponRepositoryInterface.swift
//  Domain
//
//  Created by Chaekyeong Lee on 3/30/25.
//

import Foundation
import Combine

protocol CouponRepositoryInterface {
    func fetchCoupons(request: CouponRequestDTO) -> AnyPublisher<CouponEntityList, Error>
}
