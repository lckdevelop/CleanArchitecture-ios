//
//  CouponAssembly.swift
//  CouponFeature
//
//  Created by Chaekyeong Lee on 3/31/25.
//

import Foundation
import Swinject
import Domain
import Data
import CoreKit

// 쿠폰 관련 Assembly
class CouponAssembly: Assembly {
    func assemble(container: Container) {
        // Service
        container.register(CouponServiceProtocol.self) { r in
            CouponService()
        }.inObjectScope(.transient)
        
        // Repository
        container.register(CouponRepositoryInterface.self) { r in
            CouponRepository(couponService: r.resolve(CouponServiceProtocol.self)!)
        }.inObjectScope(.transient)
        
        // Usecase
        container.register(CouponUsecaseProtocol.self) { r in
            CouponUsecase(couponRepository: r.resolve(CouponRepositoryInterface.self)!)
        }.inObjectScope(.transient)
        
        // ViewModel
        container.register(CouponViewModel.self) { r in
            CouponViewModel(couponUsecase: r.resolve(CouponUsecaseProtocol.self)! as! CouponUsecase)
        }.inObjectScope(.transient)
        
    }
}
