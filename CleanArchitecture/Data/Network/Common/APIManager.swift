//
//  DBReference.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation
import Combine


protocol APIManagerType {
    
    func request<T: Decodable>(url: String, headers: [String: String]?, parameters: Encodable?) -> AnyPublisher<T, APIError>
}

/**
 네트워크 매니저.
 싱글톤으로 사용합니다.
 
 */
final class APIManager: APIManagerType {
    
    static let shared = APIManager()
    
    private let baseURL: String
    
    private init(serverEnvironment: ServerEnvironment = APIManager.defaultEnvironment()) {
        self.baseURL = serverEnvironment.hpointURL
    }
    
    static func defaultEnvironment() -> ServerEnvironment {
        return .production
        
//        #if DEBUG
//        return .development
//        #elseif STAGING
//        return .staging
//        #else
//        return .production
//        #endif
    }
    
    private func defaultHeaders() -> [String: String] {
        var headers: [String: String] = [
            "Content-Type": "application/json",
            "connId": "",
            "authKey": "",
            "teOpsyGbcd": "02",
            "appVer": "3.1.25",
            "awakenYn": "",
            "strAutoLogin": "",
            "mblCrdNo": "",
            "globLang": "KR"
        ]
        
        return headers
    }
    
    /// 범용 fetch 함수
    /// - Parameters:
    ///   - url: 요청 URL 문자열
    ///   - requestDTO: 요청 데이터 (Codable 타입)
    ///   - responseType: 응답 데이터의 타입 (Decodable)
    /// - Returns: Combine의 AnyPublisher로 결과 반환
    func request<T: Decodable>(url: String, headers: [String: String]? = nil, parameters: Encodable? = nil) -> AnyPublisher<T, APIError> {
        
        // URL 검증
        guard let url = URL(string: baseURL + url) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        // URLRequest 생성
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST" // POST 기본값
        
        let allHeaders = defaultHeaders().merging(headers ?? [:], uniquingKeysWith: { (_, new) in new })
        for (key, value) in allHeaders {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        if let parameters = parameters {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                // 요청 데이터를 JSON으로 인코딩
                let jsonData = try JSONEncoder().encode(parameters)
                urlRequest.httpBody = jsonData
            } catch {
                return Fail(error: APIError.requestFailed("Encoding parameters failed.")).eraseToAnyPublisher()
            }
        }
        
        // Combine의 dataTaskPublisher를 사용한 네트워크 요청
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data, response) in
                // HTTP 상태 코드 확인
                if let httpResponse = response as? HTTPURLResponse,
                   (200..<300).contains(httpResponse.statusCode) {
                    return data
                } else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                    throw APIError.requestFailed("Request failed with status code: \(statusCode)")
                }
                
            }
            .decode(type: T.self, decoder: JSONDecoder()) // 응답 데이터를 Decodable로 디코딩
            .tryMap { response in
                return response
            }
            //.decode(type: ResponseWrapper<T>.self, decoder: JSONDecoder())
//            .tryMap { (responseWrapper) -> T in
//                guard let code = responseWrapper.code else {
//                    throw APIError.requestFailed("Missing code.")
//                }
//                switch code {
//                case "0000":
//                    guard let data = responseWrapper.data else {
//                        throw APIError.requestFailed("Missing data.")
//                    }
//                    return data
//                default:
//                    let message = responseWrapper.message ?? "An error occurred."
//                    throw APIError.requestFailed(message)
//                }
//            }
            .mapError { error -> APIError in
                if error is DecodingError {
                    print("Decoding Failed : \(error.localizedDescription)")
                    return APIError.decodingFailed
                } else if let apiError = error as? APIError {
                    return apiError
                } else {
                    return APIError.requestFailed("An unknown error occurred.")
                }
            }
            .eraseToAnyPublisher()
    }
}
