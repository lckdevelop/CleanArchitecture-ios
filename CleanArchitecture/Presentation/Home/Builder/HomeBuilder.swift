//
//  HomeBuilder.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/31/25.
//

import Foundation
//import Swinject
import SwiftUI

struct HomeBuilder {
    // viewmodel 생성 예시
    static func buildViewModel() -> HomeViewModel {
        let coreDI = DIContainer.shared
        
        // 의존성 주입
        let repository = coreDI.resolve(HomeRepositoryInterface.self)!
        let useCase = HomeUseCase(homeRepository: repository)
        
        return HomeViewModel(homeUseCase: useCase)
    }
    
    // 탭뷰가 아닌 화면에서 화면까지 이동할때 예시(탭뷰는 viewModel상태가 유지 되어야 하기 때문에 화면 이동까지는 비적합하다.)
    static func sendView() -> HomeScreen {
        let coreDI = DIContainer.shared
        
        // 의존성 주입
        let repository = coreDI.resolve(HomeRepositoryInterface.self)!
        let useCase = HomeUseCase(homeRepository: repository)
        let viewModel = HomeViewModel(homeUseCase: useCase)

        return HomeScreen(homeViewModel: viewModel)
    }
}

