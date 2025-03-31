//
//  CouponBuilder.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/31/25.
//

import Foundation
import Swinject
import SwiftUI
import CoreKit
import Domain

struct CouponBuilder {
    static func buildViewModel() -> CouponViewModel {
        let coreDI = DIContainer.shared

        // 의존성 주입
        let repository = coreDI.resolve(CouponRepositoryInterface.self)!
        let useCase = CouponUsecase(couponRepository: repository)

        return CouponViewModel(couponUsecase: useCase)
    }
    
    static func sendView() -> CouponScreen {
        let coreDI = DIContainer.shared

        // 의존성 주입
        let repository = coreDI.resolve(CouponRepositoryInterface.self)!
        let useCase = CouponUsecase(couponRepository: repository)
        let viewModel = CouponViewModel(couponUsecase: useCase)

        return CouponScreen(couponViewModel: viewModel)
    }
}

