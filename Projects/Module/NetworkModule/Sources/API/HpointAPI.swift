//
//  CultureAPI.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Moya
import Domain

public enum HpointAPI {
    case fetchCouponList(request: CouponRequestDTO)
}

extension HpointAPI: TargetType {
    public var baseURL: URL {
        return ServerEnvironment.hpointURL.baseURL
    }
    
    public var path: String {
        switch self {
        case .fetchCouponList:
            return "/mbo/copn/selectCopnList.nhd"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetchCouponList:
            return .post
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .fetchCouponList(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    public var headers: [String : String]? {
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
