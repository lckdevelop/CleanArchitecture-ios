//
//  DIContainer.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/18/25.
//

import Foundation
import Swinject
import Moya
/**
 의존성 주입 컨테이터.
 네비게이션 라우터, appearcne Controller, 의존성주입관련 객체들을 모두 여기서 관리할 수 있다
 */

// MARK: TODO 어셈블리로 의존성주입 모듈화에 맞게 수정해야함
protocol Assembly {
    func assemble(container: Container)
}

// 네트워킹 관련 Assembly
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

// 홈 관련
class HomeAssembly: Assembly {
    func assemble(container: Container) {
        // Service
        container.register(HomeServiceProtocol.self) { r in
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

class DIContainer: ObservableObject {
    static let shared = DIContainer()
    let container: Container
    
    private init() {
        container = Container()
    }
    
    func registerDependencies() {
        // 모든 Assembly 등록
        let assemblies: [Assembly] = [
            NetworkAssembly(),
            HomeAssembly(),
            CultureCenterAssembly(),
            CouponAssembly()
            
            
        ]
        
        // Assembly 실행
        assemblies.forEach { $0.assemble(container: container) }
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        container.resolve(T.self)
    }
}


