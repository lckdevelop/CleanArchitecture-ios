//
//  DBReference.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation
import Combine


protocol NetworkType {
    
    func fetch<T: Decodable>(url: String, parameters: Encodable?) -> AnyPublisher<T, APIError>
}

/**
 네트워크 매니저.
 싱글톤으로 사용합니다.
 
 */
final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL: String
    
    private init(environment: APIEnvironment = NetworkManager.defaultEnvironment()) {
        self.baseURL = environment.baseURL
    }
    
    static func defaultEnvironment() -> APIEnvironment {
        #if DEBUG
        return .development
        #elseif STAGING
        return .staging
        #else
        return .production
        #endif
    }
    
    /// 범용 fetch 함수
    /// - Parameters:
    ///   - url: 요청 URL 문자열
    ///   - requestDTO: 요청 데이터 (Codable 타입)
    ///   - responseType: 응답 데이터의 타입 (Decodable)
    /// - Returns: Combine의 AnyPublisher로 결과 반환
    func request<T: Decodable>(url: String, parameters: Encodable? = nil) -> AnyPublisher<T, APIError> {
        
        // URL 검증
        guard let url = URL(string: baseURL + url) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        // URLRequest 생성
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST" // POST 기본값
        
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
                   !(200...299).contains(httpResponse.statusCode) {
                    return data
                } else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                    throw APIError.requestFailed("Request failed with status code: \(statusCode)")
                }
            }
            .decode(type: ResponseWrapper<T>.self, decoder: JSONDecoder()) // 응답 데이터를 Decodable로 디코딩
            .tryMap { (responseWrapper) -> T in
                guard let status = responseWrapper.status else {
                    throw APIError.requestFailed("Missing status.")
                }
                switch status {
                case 200:
                    guard let data = responseWrapper.data else {
                        throw APIError.requestFailed("Missing data.")
                    }
                    return data
                default:
                    let message = responseWrapper.message ?? "An error occurred."
                    throw APIError.requestFailed(message)
                }
            }
            .mapError { error -> APIError in
                if error is DecodingError {
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
