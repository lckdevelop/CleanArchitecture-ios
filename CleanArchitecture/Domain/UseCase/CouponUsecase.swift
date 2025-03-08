//
//  CouponService.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import Foundation
import Combine

/**
 Domain 레이어의 Usecase 에 해당합니다.
 
 명명 규칙 : Usecase / UsecaseInterface
 
 다른 프로젝트에서도 재사용 할 수 있도록 도메인 전문가가 구성한 비지니스 로직이 정의되어야합니다.
 쿠폰 기능의 UserCase 에 해당하는 비지니스 로직을 아래에 정의하면 됩니다
 
 */
protocol CouponUsecaseInterface {
    func getCouponList(urlString: String, parameters: CouponRequestDTO) -> AnyPublisher<CouponList, APIError>
}

final class CouponUsecase: CouponUsecaseInterface {

    private let repository: CouponRepositoryInterface

    init(repository: CouponRepositoryInterface) {
        self.repository = repository
    }
    
    func getCouponList(urlString: String, parameters: CouponRequestDTO) -> AnyPublisher<CouponList, APIError> {
        return repository.fetchCoupons(urlString: urlString, parameters: parameters)
    }
}


