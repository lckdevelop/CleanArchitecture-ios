//
//  HomeInfoUseCase.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import Foundation
import Combine

protocol HomeInfoUseCaseProtocol {
    func execute(request: HomeBannerRequest) -> AnyPublisher<HomeEntity, Error>
}

final class HomeInfoUseCase: HomeInfoUseCaseProtocol {
    private let repository: HomeRepositoryInterface
    
    init(repository: HomeRepositoryInterface) {
        self.repository = repository
    }
    
    func execute(request: HomeBannerRequest) -> AnyPublisher<HomeEntity, Error> {
        return repository.fetchHomeInfo(request: request)
    }
}
