//
//  CultureSearchListUseCase.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

protocol CultureSearchListUseCase {
    func execute(lectureSearchFilter: CultureLecture,
                 completion: @escaping (Result<[CultureLecture], Error>) -> Void)
}

final class DefaultCultureSearchListUseCase: CultureSearchListUseCase {
    private let repository: CultureSearchResultRepository
    
    init(repository: CultureSearchResultRepository) {
        self.repository = repository
    }
    
    func execute(lectureSearchFilter: CultureLecture, completion: @escaping (Result<[CultureLecture], Error>) -> Void) {
        repository.fetchSearchResult(request: lectureSearchFilter, completion: completion)
    }
}
