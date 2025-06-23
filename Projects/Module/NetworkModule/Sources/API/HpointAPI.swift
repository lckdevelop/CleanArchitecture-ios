//
//  CultureAPI.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Moya

public enum HpointAPI {
    case fetchCouponList(request: CouponRequest)
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
    
    public var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "connId": "",
            "authKey": "",
            "teOpsyGbcd": "02",
            "appVer": "3.1.50", // H.Point APP 필수 버전 3.1.35 이상
            "awakenYn": "",
            "strAutoLogin": "",
            "mblCrdNo": "",
            "globLang": "KR"
        ]
    }
}
