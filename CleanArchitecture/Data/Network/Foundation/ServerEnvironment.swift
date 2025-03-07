//
//  ServerEnvironment.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

enum ServerEnvironment {
    case development //개발서버
    case staging //스테이징서버
    case production //운영서버

    var ehyundaiURL: String {
        switch self {
        case .development:
            return "http://dev.ehyundai.com:18011"
        case .staging:
            return "https://www.ehyundai.com"
        case .production:
            return "https://www.ehyundai.com"
        }
    }
    
    var ehyundaiAppURL: String {
        switch self {
        case .development:
            return "https://hdeappdev.ehyundai.com:18911"
        case .staging:
            return "https://hdeappstg.ehyundai.com"
        case .production:
            return "https://hdeapp.ehyundai.com"
        }
    }
    
    var hpointURL: String {
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

