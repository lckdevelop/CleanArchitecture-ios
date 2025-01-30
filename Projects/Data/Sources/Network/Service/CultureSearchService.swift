//
//  CultureSearchService.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Moya

protocol CultureSearchServiceProtocol {
    func getCultureLectureSearchList(request: CultureSearchResultRequestDTO,
                                completion: @escaping (Result<CultureSearchResultResponseDTO, Error>) -> Void)
}

class CultureSearchService: CultureSearchServiceProtocol {
    static let shared = CultureSearchService()
    private let provider = MoyaProvider<BaseAPI>()
    
    private init() {}
    
    func getCultureLectureSearchList(request: CultureSearchResultRequestDTO,
                                completion: @escaping (Result<CultureSearchResultResponseDTO, Error>) -> Void) {
            provider.request(.getCultureLectureSearchList(request: request)) { result in
                switch result {
                case .success(let response):
                    do {
                        let decoder = JSONDecoder()
                        let networkResult = try decoder.decode(CultureSearchResultResponseDTO.self, from: response.data)
                        completion(.success(networkResult))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}
