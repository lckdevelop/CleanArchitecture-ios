//
//  CultureAPI.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Moya

enum CultureAPI {
    case getCultureLectureSearchList(request: CultureSearchRequest)
}

extension CultureAPI: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: ServerEnvironment.production.ehyundaiAppURL) else {
            fatalError("[Error] - No Base URL!")
        }
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getCultureLectureSearchList:
            return "/public-api/culture/v1/newFindCourseList.do"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCultureLectureSearchList:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getCultureLectureSearchList(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
