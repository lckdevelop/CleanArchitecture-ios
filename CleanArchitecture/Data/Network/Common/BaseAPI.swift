//
//  BaseAPI.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Moya

enum BaseAPI {
    case getCultureLectureSearchList(request: CultureSearchResultRequestDTO)
}

extension BaseAPI: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: ServerType.release.urlEHyundaiApp) else {
            fatalError("[Error] - Base URL이 없습니다!")
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
//            return .requestParameters(parameters: [
//                "units": "metric",
//                "lang": "kr",
//                "q": request
//            ], encoding: URLEncoding.httpBody)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getCultureLectureSearchList:
            return ["Content-type": "application/json"]
        }
    }
}
