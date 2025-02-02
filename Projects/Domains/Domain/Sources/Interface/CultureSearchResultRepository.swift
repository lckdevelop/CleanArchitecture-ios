//
//  CultureSearchResultRepository.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

public protocol CultureSearchResultRepository {
    func fetchSearchResult(request: CultureSearchRequest,
                      completion: @escaping (Result<[CultureLecture], Error>) -> Void)
}


