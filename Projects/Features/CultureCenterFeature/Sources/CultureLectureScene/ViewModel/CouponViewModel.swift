//
//  CouponViewModel.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation
import Combine
import Domain
import Data

/**
 ViewModel -> Service -> Repository 의존성을 가진다. (의존성 역전으로 구현체에 의존하지는 않고 protocol 에 의존함)
 
 
 */
class CouponViewModel: ObservableObject {
    @Published var couponList: CouponList?
    @Published var errorMessage: String?
    
    private let couponService: CouponServiceType
    private var cancellables = Set<AnyCancellable>()
    
    init(couponService: CouponServiceType) {
        self.couponService = couponService
    }
    
    func loadCouponList() {
        let couponRequestDto = CouponRequestDTO(mcustNo: "", copnGbcd: "01", prfrYn: "N", ptcoId: nil)
        let response: AnyPublisher<CouponList, APIError> = couponService.getCouponList(urlString: "/mbo/copn/selectCopnList.nhd", parameters: couponRequestDto)
        
        response
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    print("\(failure)")
                }
            }, receiveValue: { [weak self] coupons in
                self?.couponList = coupons
            })
            .store(in: &cancellables)
        
    }
}
