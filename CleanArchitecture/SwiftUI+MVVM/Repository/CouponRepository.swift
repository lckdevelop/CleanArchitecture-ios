//
//  CouponRepository.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation
import Combine

protocol CouponRepositoryType {
    func fetchCoupons() -> AnyPublisher<[Coupon], APIError>
}


final class CouponRepository: CouponRepositoryType {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    func fetchCoupons() -> AnyPublisher<[Coupon], APIError> {
        return networkManager.request(url: "", parameters: CouponRequestDTO.self as? Encodable)
    }
}


