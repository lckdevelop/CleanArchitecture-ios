//
//  CultureSearchResultRepository.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

protocol CultureSearchResultRepository {
    func fetchSearchResult(request: CultureSearchResultRequestDTO,
                      completion: @escaping (Result<[CultureLecture], Error>) -> Void)
}



