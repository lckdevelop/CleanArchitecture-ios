//
//  HomeService.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import Foundation
import Combine
import Moya

protocol HomeServiceProtocol {
    func fetchHomeInfoList(request: HomeBannerRequest) -> AnyPublisher<HomeBannerResponse, Error>
                                
}

final class HomeService: BaseService<EHyundaiAppAPI>, HomeServiceProtocol {
    public func fetchHomeInfoList(request: HomeBannerRequest) -> AnyPublisher<HomeBannerResponse, Error> {
        requestObjectInCombine(.getHomeInfoList(request: request))
    }
}

