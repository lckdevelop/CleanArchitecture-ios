//
//  EHyundaiAppAPI.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import Foundation
import Moya
import Domain

public enum EHyundaiAppAPI {
    case getHomeInfoList(request: HomeBannerRequest)
    case getCultureLectureSearchList(request: CultureSearchRequest)
}

extension EHyundaiAppAPI: TargetType {
    public var baseURL: URL {
        return ServerEnvironment.ehyundaiAppURL.baseURL
    }
    
    public var path: String {
        switch self {
        case .getHomeInfoList:
            return "/public-api/shopping/v1/subMain.do"
        case .getCultureLectureSearchList:
            return "/public-api/culture/v1/newFindCourseList.do"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getHomeInfoList:
            return .post
        case .getCultureLectureSearchList:
            return .post
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .getHomeInfoList(let request):
            return .requestJSONEncodable(request)
        case .getCultureLectureSearchList(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "connId": "",
            "authKey": "",
            "teOpsyGbcd": "",
            "appVer": "",
            "awakenYn": "",
            "strAutoLogin": "",
            "mblCrdNo": "",
            "globLang": "KR"
        ]
    }
}
