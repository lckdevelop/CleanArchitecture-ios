//
//  HomeRepositoryInterface.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import Foundation
import Combine

protocol HomeRepositoryInterface {
    func fetchHomeInfo(request:HomeBannerRequest) -> AnyPublisher<HomeEntity, Error>
}
