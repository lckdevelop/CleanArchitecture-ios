//
//  HomeBuilder.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/31/25.
//

import Foundation
import Swinject
import SwiftUI
import CoreKit
import Domain

public struct HomeBuilder {
    // viewmodel 생성 예시
    public static func buildViewModel() -> HomeViewModel {
        @Injected var homeRepository: HomeRepositoryInterface
        let useCase = HomeUseCase(homeRepository: homeRepository)

        return HomeViewModel(homeUseCase: useCase)
    }
    
    // 탭뷰가 아닌 화면에서 화면까지 이동할때 예시(탭뷰는 viewModel상태가 유지 되어야 하기 때문에 화면 이동까지는 비적합하다.)
//    public static func sendView() -> HomeScreen {
//        @Injected var homeRepository: HomeRepositoryInterface
////        let coreDI = DIContainer.shared
////        
////        // 의존성 주입
////        let repository = coreDI.resolve(HomeRepositoryInterface.self)!
//        let useCase = HomeUseCase(homeRepository: homeRepository)
//        let viewModel = HomeViewModel(homeUseCase: useCase)
//
//        return HomeScreen(router: <#any RoutingProtocol#>, homeViewModel: viewModel)
//    }
}

