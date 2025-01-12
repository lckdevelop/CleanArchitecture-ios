//
//  CouponViewModel.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import Foundation
import Combine

// SwiftUI 활용하여 viewModel 이 ObservableObject 프로토콜을 채택해야한다
//protocol CouponViewModel {
//
//}

protocol CouponViewModelInterface: ObservableObject {
    
}

final class CouponViewModel: CouponViewModelInterface {
    @Published var coupons: [Coupon]
    
    init(coupons: [Coupon]) {
        self.coupons = coupons
    }
}

