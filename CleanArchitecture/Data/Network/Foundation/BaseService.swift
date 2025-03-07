//
//  BaseService.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import Foundation
import Combine
import Moya


class BaseService<Target: TargetType> {
    typealias API = Target
    
    private lazy var provider = MoyaProvider<API>(plugins: [MoyaLoggingPlugin()])
    
//    func requestObjectInCombine<T: Decodable>(_ target: API) -> AnyPublisher<T, Error> {
//        return Future { promise in
//            self.provider.request(target) { response in
//                switch response {
//                case .success(let value):
//                    do {
//                        let decoder = JSONDecoder()
//                        let body = try decoder.decode(T.self, from: value.data)
//                        promise(.success(body))
//                    } catch let error {
//                        promise(.failure(error))
//                    }
//                case .failure(let error):
//                        promise(.failure(error))
//                    
//                }
//            }
//        }.eraseToAnyPublisher()
//    }
    
    func requestObjectInCombine<T: Decodable>(_ target: API) -> AnyPublisher<T, Error> {
        return Future { promise in
            self.provider.request(target) { response in
                switch response {
                case .success(let value):
                    do {
                        guard let response = value.response else { throw NSError(domain: "No response", code: -1000) }
                        
                        switch response.statusCode {
                        case 200...399:
                            let decoder = JSONDecoder()
                            let body = try decoder.decode(T.self, from: value.data)
                            promise(.success(body))
                        case 400...599:
                            let decoder = JSONDecoder()
                            let body = try decoder.decode(ErrorResponse.self, from: value.data)
                            let apiError = APIError(error: NSError(domain: "임시에러", code: -1001), statusCode: response.statusCode, response: body)
                            throw apiError
                        default: break
                        }
                    } catch let error {
                        promise(.failure(error))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
