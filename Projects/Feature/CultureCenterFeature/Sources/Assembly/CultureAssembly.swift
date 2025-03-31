//
//  CultureAssembly.swift
//  CultureFeature
//
//  Created by Chaekyeong Lee on 3/31/25.
//

import Foundation
import Swinject
import Domain
import Data
import CoreKit

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
