//
//  ErrorResponse.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import Foundation

struct ErrorResponse: Decodable, Equatable {
    public let statusCode: String
    public let responseMessage: String
}
