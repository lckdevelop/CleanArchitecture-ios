//
//  CultureRepository.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Domain
import Combine
import NetworkModule

public final class CultureRepository {
    
    private let cultureService: CultureServiceProtocol
    
    public init(cultureService: CultureServiceProtocol) {
        self.cultureService = cultureService
    }
}

extension CultureRepository: CultureRepositoryInterface {
    public func fetchSearchResult(cultureSearch: CultureSearch) -> AnyPublisher<[CultureLectureEntity], Error> {
        let cultureSearchRequest = cultureSearch.toData()
        
        return cultureService.getCultureLectureSearchList(request: cultureSearchRequest)
            .tryMap { response in
                guard let list = response.data?.applyCrsList else {
                    return [CultureLectureEntity]()
                }
                return list.map { $0.toDomain() }
            }
            .eraseToAnyPublisher()
    }

    
}
