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

public struct CouponBuilder {
    public static func buildViewModel() -> CouponViewModel {
        @Injected var couponRepository: CouponRepositoryInterface

        let useCase = CouponUsecase(couponRepository: couponRepository)
        return CouponViewModel(couponUsecase: useCase)
    }
    
//    public static func sendView() -> CouponScreen {
//        @Injected var couponRepository: CouponRepositoryInterface
////        let coreDI = DIContainer.shared
////
////        // 의존성 주입
////        let repository = coreDI.resolve(CouponRepositoryInterface.self)!
//        let useCase = CouponUsecase(couponRepository: couponRepository)
//        let viewModel = CouponViewModel(couponUsecase: useCase)
//
//        return CouponScreen(router: AppRouter(), couponViewModel: viewModel)
//    }
}

