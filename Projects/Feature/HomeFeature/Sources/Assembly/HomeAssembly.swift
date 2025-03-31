//
//  HomeAssembly.swift
//  HomeFeature
//
//  Created by Chaekyeong Lee on 3/31/25.
//

import Foundation
import Swinject
import Domain
import Data
import CoreKit

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
