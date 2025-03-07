//
//  HomeService.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import Foundation
import Combine
import Moya

typealias HomeService = BaseService<HomeAPI>

protocol HomeServiceProtocol {
    func getHomeInfoList(request: HomeBannerRequest) -> AnyPublisher<HomeBannerResponse, Error>
                                
}

extension HomeService: HomeServiceProtocol {
    public func getHomeInfoList(request: HomeBannerRequest) -> AnyPublisher<HomeBannerResponse, Error> {
        requestObjectInCombine(.getHomeInfoList(request: request))
    }
}

