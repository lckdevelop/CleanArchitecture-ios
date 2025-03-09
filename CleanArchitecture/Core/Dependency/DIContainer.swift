//
//  DIContainer.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/18/25.
//

import Foundation
import Swinject
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
        container.register(APIManagerType.self) { _ in
            APIManager.shared
        }.inObjectScope(.container)
    }
}

// 쿠폰 관련 Assembly
class CouponAssembly: Assembly {
    func assemble(container: Container) {
        // Repository
        container.register(CouponRepositoryInterface.self) { r in
            CouponRepository(networkManager: r.resolve(APIManagerType.self) as! APIManager)
        }.inObjectScope(.transient)
        
        // Usecase
        container.register(CouponUsecaseInterface.self) { r in
            CouponUsecase(repository: r.resolve(CouponRepositoryInterface.self)!)
        }.inObjectScope(.transient)
        
        // ViewModel
        container.register(CouponViewModel.self) { r in
            CouponViewModel(couponService: r.resolve(CouponUsecaseInterface.self)!)
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
            CouponAssembly()
            // 추후 다른 모듈의 Assembly 추가
        ]
        
        // Assembly 실행
        assemblies.forEach { $0.assemble(container: container) }
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        container.resolve(T.self)
    }
}


