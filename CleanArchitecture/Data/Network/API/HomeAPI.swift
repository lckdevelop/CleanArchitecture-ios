//
//  HomeAPI.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import Foundation
import Moya

enum HomeAPI {
    case getHomeInfoList(request: HomeBannerRequest)
}

extension HomeAPI: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: ServerEnvironment.production.ehyundaiAppURL) else {
            fatalError("[Error] - No Base URL!")
        }
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getHomeInfoList:
            return "/public-api/shopping/v1/subMain.do"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getHomeInfoList:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getHomeInfoList(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
