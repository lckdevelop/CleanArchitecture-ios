//
//  CultureSearchListUseCase.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

public protocol CultureSearchListUseCase {
    func execute(lectureSearchFilter: CultureSearchRequest,
                 completion: @escaping (Result<[CultureLecture], Error>) -> Void)
}

public final class DefaultCultureSearchListUseCase: CultureSearchListUseCase {
    private let repository: CultureSearchResultRepository
    
    public init(repository: CultureSearchResultRepository) {
        self.repository = repository
    }
    
    public func execute(lectureSearchFilter: CultureSearchRequest, completion: @escaping (Result<[CultureLecture], Error>) -> Void) {
        repository.fetchSearchResult(request: lectureSearchFilter, completion: completion)
    }
}
