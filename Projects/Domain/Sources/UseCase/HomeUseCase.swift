//
//  HomeUseCase.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import Foundation
import Combine

public protocol HomeUseCaseProtocol {
    func fetchHomeBanners(request: HomeBannerRequest) -> AnyPublisher<HomeEntity, Error>
}

public final class HomeUseCase: HomeUseCaseProtocol {
    private let homeRepository: HomeRepositoryInterface
    
    public init(homeRepository: HomeRepositoryInterface) {
        self.homeRepository = homeRepository
    }
    
    public func fetchHomeBanners(request: HomeBannerRequest) -> AnyPublisher<HomeEntity, Error> {
        return homeRepository.fetchHomeInfo(request: request)
    }
}
