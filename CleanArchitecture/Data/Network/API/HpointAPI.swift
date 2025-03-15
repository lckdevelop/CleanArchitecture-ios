//
//  CultureAPI.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Moya

enum HpointAPI {
    case fetchCouponList(request: CouponRequestDTO)
}

extension HpointAPI: TargetType {
    var baseURL: URL {
        return ServerEnvironment.hpointURL.baseURL
    }
    
    var path: String {
        switch self {
        case .fetchCouponList:
            return "/mbo/copn/selectCopnList.nhd"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchCouponList:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchCouponList(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "connId": "",
            "authKey": "",
            "teOpsyGbcd": "02",
            "appVer": "3.1.25",
            "awakenYn": "",
            "strAutoLogin": "",
            "mblCrdNo": "",
            "globLang": "KR"
        ]
    }
}
