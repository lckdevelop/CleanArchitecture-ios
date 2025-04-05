//
//  BaseService.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import Foundation
import Combine
import Moya


open class BaseService<Target: TargetType> {
    typealias API = Target
    
    private lazy var provider = MoyaProvider<API>(plugins: [MoyaLoggingPlugin()])
    
    public init() {}
    
    func requestObjectInCombine<T: Decodable>(_ target: API) -> AnyPublisher<T, Error> {
        return Future { promise in
            self.provider.request(target) { response in
                switch response {
                case .success(let value):
                    do {
                        guard let response = value.response else { throw NSError(domain: "No response", code: -1000) }
                        
                        let decoder = JSONDecoder()
                        
                        switch response.statusCode {
                        case 200...399:
                            let decoded = try decoder.decode(T.self, from: value.data)
                            promise(.success(decoded))
                        case 400...599:
                            let errorResponse = try decoder.decode(ErrorResponse.self, from: value.data)
                            let apiError = APIError.network(statusCode: response.statusCode, response: errorResponse)
                            throw apiError
                        default:
                            throw APIError.unknown
                        }
                    } catch let error as APIError {
                        promise(.failure(error))
                    } catch {
                        promise(.failure(APIError.requestFailed(error.localizedDescription)))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
