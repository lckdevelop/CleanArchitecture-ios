//
//  CouponViewModel.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation
import Combine

class CouponViewModel: ObservableObject {
    @Published var coupons: [Coupon] = []
    @Published var errorMessage: String?
    
    private let couponService: CouponServiceType
    private var cancellables = Set<AnyCancellable>()
    
    init(couponService: CouponServiceType) {
        self.couponService = couponService
    }
    
    func loadCouponList() {
        couponService.getCouponList()
            //.receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    print("\(failure)")
                }
            }, receiveValue: { [weak self] coupons in
                self?.coupons = coupons
            })
            .store(in: &cancellables)
        
    }
}
