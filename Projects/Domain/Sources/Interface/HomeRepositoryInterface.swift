//
//  HomeRepositoryInterface.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import Foundation
import Combine

public protocol HomeRepositoryInterface {
    func fetchHomeInfo(homeInfo:HomeInfo) -> AnyPublisher<HomeEntity, Error>
}
