//
//  CultureUseCase.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Combine

public protocol CultureUseCaseProtocol {
    func fetchCultureList(cultureSearchRequest: CultureSearchRequest) -> AnyPublisher<[CultureLecture], Error>
}

public final class CultureUseCase: CultureUseCaseProtocol {
    private let cultureRepository: CultureRepositoryInterface
    
    public init(cultureRepository: CultureRepositoryInterface) {
        self.cultureRepository = cultureRepository
    }
    
    public func fetchCultureList(cultureSearchRequest: CultureSearchRequest) -> AnyPublisher<[CultureLecture], Error> {
        return cultureRepository.fetchSearchResult(request: cultureSearchRequest)
    }
}
