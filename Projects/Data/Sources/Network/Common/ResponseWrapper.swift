//
//  ResponseWrapper.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation

struct ResponseWrapper<T: Decodable>: Decodable {
    let message: String?
    let code: String?
    let data: T?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        code = try container.decodeIfPresent(String.self, forKey: .message)
        data = try container.decodeIfPresent(T.self, forKey: .data)
    }

    private enum CodingKeys: String, CodingKey {
        case message
        case code
        case data // data 필드에 서버 response Model 을 맵핑
    }
}
