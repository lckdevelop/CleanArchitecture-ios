//
//  CouponRepository.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation
import Combine

protocol CouponRepositoryType {
    func fetchCoupons(urlString: String, parameters: CouponRequestDTO) -> AnyPublisher<CouponList, APIError>
}


final class CouponRepository: CouponRepositoryType {
    
    private let networkManager: APIManager
    
    init(networkManager: APIManager = .shared) {
        self.networkManager = networkManager
    }
    
    func fetchCoupons(urlString: String, parameters: CouponRequestDTO) -> AnyPublisher<CouponList, APIError> {
        return networkManager.request(url: urlString, parameters: parameters)
    }
}


