//
//  Coupon.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import Foundation

public struct CouponList: Decodable {
    public let code: String?
    public let message: String?
    public let coupons: [Coupon]?

    public enum CodingKeys: String, CodingKey {
        case code
        case message
        case coupons = "copnList"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        coupons = try values.decodeIfPresent([Coupon].self, forKey: .coupons)
    }
}

public struct Coupon: Decodable {
    public let campId: String?
    public let ofrId: String?
    public let name: String?
    public let titleImage: String?
    public let copnTypeGbcd: String?

    public enum CodingKeys: String, CodingKey {
        case campId = "campId"
        case ofrId = "ofrId"
        case name = "copnNm"
        case titleImage = "copnImgUrl" // 이미지
        case copnTypeGbcd = "ofrTypeGbcd"  //쿠폰유형구분코드

    }
}

public struct CouponRequestDTO: Encodable {
    public let mcustNo: String?
    public let copnGbcd: String?
    public let prfrYn: String?
    public let ptcoId: String?
    
    public init(mcustNo: String?, copnGbcd: String?, prfrYn: String?, ptcoId: String?) {
        self.mcustNo = mcustNo
        self.copnGbcd = copnGbcd
        self.prfrYn = prfrYn
        self.ptcoId = ptcoId
    }
    
}
