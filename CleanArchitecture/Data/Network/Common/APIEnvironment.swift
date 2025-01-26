//
//  Untitled.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation

enum APIEnvironment {
    case development
    case staging
    case production

    var baseURL: String {
        switch self {
        case .development:
            return "https://mdev.h-point.co.kr:29845"
        case .staging:
            return "https://m-stg.h-point.co.kr"
        case .production:
            return "https://m.h-point.co.kr:29845"
        }
    }
}
