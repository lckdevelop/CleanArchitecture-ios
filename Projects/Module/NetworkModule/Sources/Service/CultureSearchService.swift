//
//  CultureSearchService.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Moya
import Combine

public protocol CultureServiceProtocol {
    func getCultureLectureSearchList(request: CultureSearchRequest) -> AnyPublisher<CultureSearchResponse, Error>
}

public final class CultureService: BaseService<EHyundaiAppAPI>, CultureServiceProtocol {
    public override init() {
        super.init()
    }
    
    public func getCultureLectureSearchList(request: CultureSearchRequest) -> AnyPublisher<CultureSearchResponse, Error> {
        requestObjectInCombine(.getCultureLectureSearchList(request: request))
    }
}
