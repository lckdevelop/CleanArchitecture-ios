//
//  CouponService.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import Foundation
import Combine
/**
 Domain 레이어.
 폴더링 명명규칙은 Service 로 지정했습니다.
 UserCase 에 해당하는 비지니스 로직을 아래에 정의하면 됩니다
 
 */
protocol CouponServiceType {
    func getCouponList(urlString: String, parameters: CouponRequestDTO) -> AnyPublisher<CouponList, APIError>
}

final class CouponService: CouponServiceType {

    private let repository: CouponRepositoryType

    init(repository: CouponRepositoryType) {
        self.repository = repository
    }
    
    func getCouponList(urlString: String, parameters: CouponRequestDTO) -> AnyPublisher<CouponList, APIError> {
        return repository.fetchCoupons(urlString: urlString, parameters: parameters)
    }
}


