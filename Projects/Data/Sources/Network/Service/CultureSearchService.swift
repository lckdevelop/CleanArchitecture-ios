//
//  CultureSearchService.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Moya
import Domain


public protocol CultureServiceProtocol {
    func getCultureLectureSearchList(request: CultureSearchRequest,
                                completion: @escaping (Result<CultureSearchResponse, Error>) -> Void)
}

public final class CultureService: CultureServiceProtocol {
    private lazy var provider = MoyaProvider<EHyundaiAppAPI>(plugins: [MoyaLoggingPlugin()])
    
    public func getCultureLectureSearchList(request: CultureSearchRequest,
                                completion: @escaping (Result<CultureSearchResponse, Error>) -> Void) {
        provider.request(.getCultureLectureSearchList(request: request)) { result in
                switch result {
                case .success(let response):
                    do {
                        let decoder = JSONDecoder()
                        let networkResult = try decoder.decode(CultureSearchResponse.self, from: response.data)
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
