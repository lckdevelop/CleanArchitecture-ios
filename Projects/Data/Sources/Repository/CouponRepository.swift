//
//  CouponRepository.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation
import Combine
import Domain
import NetworkModule

/**
 Repository 레이어에 해당합니다.
 Domain 영역과 과 Repository 의 인터페이스 역할을 담당합니다.
 
 명명 규칙 : Repository / RepositoryInterface
 
 DB 및 외부 API등을 통해 내부/외부 데이터를 사용하는곳입니다.
 
 */

public final class CouponRepository: CouponRepositoryInterface {
    
    private let couponService: CouponServiceProtocol
    
    public init(couponService: CouponServiceProtocol) {
        self.couponService = couponService
    }
    
    public func fetchCoupons(couponRequestDTO: CouponRequestDTO) -> AnyPublisher<[CouponEntity], Error> {
        let couponRequest = couponRequestDTO.toData()
        
        return couponService.fetchCouponList(couponRequest: couponRequest)
            .map { couponListResponse in
                couponListResponse.coupons.map { $0.toDomain() }
            }
            .eraseToAnyPublisher()
    }
}


