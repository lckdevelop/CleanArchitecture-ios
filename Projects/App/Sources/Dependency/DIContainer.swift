//
//  DIContainer.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/18/25.
//

import Foundation
import Swinject
import Moya
import Data
import Domain

public final class DIContainer: ObservableObject {
    public static let shared = DIContainer()
    let container: Container

    private init() {
        container = Container()
        registerDependencies()
    }

    func registerDependencies() {
        // 모든 Core Assembly 등록
        let assemblies: [Assembly] = [
            NetworkAssembly(),
            CoreServiceAssembly(),
            CoreRepositoryAssembly()
        ]

        assemblies.forEach { $0.assemble(container: container) }
    }

    public func resolve<T>(_ type: T.Type) -> T? {
        container.resolve(T.self)
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


