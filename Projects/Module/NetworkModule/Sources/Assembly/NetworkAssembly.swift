//
//  NetworkAssembly.swift
//  NetworkModule
//
//  Created by Chaekyeong Lee on 3/31/25.
//

import Foundation
import Swinject
import Domain
import Data

// 홈 관련
class HomeAssembly: Assembly {
    func assemble(container: Container) {
        // Service
        container.register(HomeServiceProtocol.self) { _ in
            HomeService()
        }.inObjectScope(.transient)
        
        // Repository
        container.register(HomeRepositoryInterface.self) { r in
            HomeRepository(homeService: r.resolve(HomeServiceProtocol.self)!)
        }.inObjectScope(.transient)
        
        // Usecase
        container.register(HomeUseCaseProtocol.self) { r in
            HomeUseCase(homeRepository: r.resolve(HomeRepositoryInterface.self)!)
        }.inObjectScope(.transient)
        
        // ViewModel
        container.register(HomeViewModel.self) { r in
            HomeViewModel(homeUseCase: r.resolve(HomeUseCaseProtocol.self)! as! HomeUseCase)
        }.inObjectScope(.transient)
    }
}

// 문화센터 관련
class CultureCenterAssembly: Assembly {
    func assemble(container: Container) {
        // Service
        container.register(CultureServiceProtocol.self) { r in
            CultureService()
        }.inObjectScope(.transient)
        
        // Repository
        container.register(CultureRepositoryInterface.self) { r in
            CultureRepository(cultureService: r.resolve(CultureServiceProtocol.self)!)
        }.inObjectScope(.transient)
        
        // Usecase
        container.register(CultureUseCaseProtocol.self) { r in
            CultureUseCase(cultureRepository: r.resolve(CultureRepositoryInterface.self)!)
        }.inObjectScope(.transient)
        
        // ViewModel
        container.register(CultureCenterViewModel.self) { r in
            CultureCenterViewModel(cultureUseCase: r.resolve(CultureUseCaseProtocol.self)! as! CultureUseCase)
        }.inObjectScope(.transient)
    }
}

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

