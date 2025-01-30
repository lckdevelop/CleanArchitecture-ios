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
}
