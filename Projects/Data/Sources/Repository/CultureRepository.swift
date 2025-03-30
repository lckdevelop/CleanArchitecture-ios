//
//  CultureRepository.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import RxSwift
import RxRelay
import RxDataSources

final class CultureRepository {
    
    private let cultureService: CultureServiceProtocol
    
    init(cultureService: CultureServiceProtocol) {
        self.cultureService = cultureService
    }
}

extension CultureRepository: CultureRepositoryInterface {
    
    func fetchSearchResult(request: CultureSearchRequest,
                          completion: @escaping (Result<[CultureLecture], Error>) -> Void) {
        cultureService.getCultureLectureSearchList(request: request) { result in
            switch result {
            case .success(let entity):
                var searchLectureList: [CultureLecture] = []
                
                if let applyCrsList = entity.data?.applyCrsList {
                    for applyCrs in applyCrsList {
                        searchLectureList.append(applyCrs.toDomain())
                    }
                }
                completion(.success(searchLectureList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
}
