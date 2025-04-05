//
//  HomeService.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import Foundation
import Combine
import Moya

public protocol HomeServiceProtocol {
    func fetchHomeInfoList(request: HomeBannerRequest) -> AnyPublisher<HomeBannerResponse, Error>
                                
}

public final class HomeService: BaseService<EHyundaiAppAPI>, HomeServiceProtocol {
    public override init() {
        super.init()
    }
    
    public func fetchHomeInfoList(request: HomeBannerRequest) -> AnyPublisher<HomeBannerResponse, Error> {
        requestObjectInCombine(.getHomeInfoList(request: request))
    }
}

