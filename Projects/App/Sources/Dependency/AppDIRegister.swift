//
//  AppDIRegister.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 4/2/25.
//

import Foundation
import Swinject
import CoreKit
import Moya
import Data
import Domain

final class AppDIRegister {
    static func registerDependencies() {
        let container = DIContainer.shared.container
        
        // 라우터 관련 Assembly
        let AppRouterAssemblies: [Assembly] = [
            AppRouterAssembly()
        ]
        
        // 네트워크 관련 Assembly
        let networkAssemblies: [Assembly] = [
            NetworkAssembly()
        ]
        
        // Core Service & Repository Assembly
        let coreAssemblies: [Assembly] = [
            CoreServiceAssembly(),
            CoreRepositoryAssembly()
        ]

        // 모든 Assembly 등록
        let allAssemblies = AppRouterAssemblies + networkAssemblies + coreAssemblies
        allAssemblies.forEach { $0.assemble(container: container) }
    }
}

// Router 관련 Assembly
class AppRouterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppRouter.self) { _ in
            AppRouter()
        }
        .inObjectScope(.container) // 싱글톤 유지
    }
}

// 네트워크 관련 Assembly
class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MoyaProvider<EHyundaiAppAPI>.self) { _ in
            MoyaProvider<EHyundaiAppAPI>()
        }
        container.register(MoyaProvider<HpointAPI>.self) { _ in
            MoyaProvider<HpointAPI>()
        }
    }
}

// Core Service 등록
class CoreServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeServiceProtocol.self) { _ in HomeService() }
        container.register(CultureServiceProtocol.self) { _ in CultureService() }
        container.register(CouponServiceProtocol.self) { _ in CouponService() }
    }
}

// Core Repository 등록
class CoreRepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeRepositoryInterface.self) { r in
            HomeRepository(homeService: r.resolve(HomeServiceProtocol.self)!)
        }
        container.register(CultureRepositoryInterface.self) { r in
            CultureRepository(cultureService: r.resolve(CultureServiceProtocol.self)!)
        }
        container.register(CouponRepositoryInterface.self) { r in
            CouponRepository(couponService: r.resolve(CouponServiceProtocol.self)!)
        }
    }
}
