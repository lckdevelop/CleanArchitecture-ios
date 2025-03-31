//
//  CultureUseCase.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

public protocol CultureUseCaseProtocol {
    func fetchCultureList(cultureSearchRequest: CultureSearchRequest,
                 completion: @escaping (Result<[CultureLecture], Error>) -> Void)
}

public final class CultureUseCase: CultureUseCaseProtocol {
    private let cultureRepository: CultureRepositoryInterface
    
    public init(cultureRepository: CultureRepositoryInterface) {
        self.cultureRepository = cultureRepository
    }
    
    public func fetchCultureList(cultureSearchRequest: CultureSearchRequest, completion: @escaping (Result<[CultureLecture], Error>) -> Void) {
        cultureRepository.fetchSearchResult(request: cultureSearchRequest, completion: completion)
    }
}
