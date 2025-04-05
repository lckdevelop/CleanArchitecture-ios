//
//  CultureRepository.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Domain
import Combine

public final class CultureRepository {
    
    private let cultureService: CultureServiceProtocol
    
    public init(cultureService: CultureServiceProtocol) {
        self.cultureService = cultureService
    }
}

extension CultureRepository: CultureRepositoryInterface {
    public func fetchSearchResult(request: CultureSearchRequest) -> AnyPublisher<[CultureLecture], Error> {
        return cultureService.getCultureLectureSearchList(request: request)
            .tryMap { response in
                guard let list = response.data?.applyCrsList else {
                    return [CultureLecture]()
                }
                return list.map { $0.toDomain() }
            }
            .eraseToAnyPublisher()
    }

    
}
