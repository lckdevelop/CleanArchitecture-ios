//
//  APIError.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed(String)
    case decodingFailed
    case network(statusCode: Int, response: ErrorResponse)
    case unknown
    
    init(error: Error, statusCode: Int? = 0, response: ErrorResponse) {
        guard let statusCode else { self = .unknown ; return }
        
        self = .network(statusCode: statusCode, response: response)
    }
}
