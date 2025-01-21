//
//  Coupon.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import Foundation

struct CouponList: Decodable {
    let code: String?
    let message: String?
    let coupons: [Coupon]?

    enum CodingKeys: String, CodingKey {
        case code
        case message
        case coupons = "copnList"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        coupons = try values.decodeIfPresent([Coupon].self, forKey: .coupons)
    }
}

struct Coupon: Decodable {
    let campId: String?
    let ofrId: String?
    let name: String?
    let titleImage: String?
    let copnTypeGbcd: String?

    enum CodingKeys: String, CodingKey {
        case campId = "campId"
        case ofrId = "ofrId"
        case name = "copnNm"
        case titleImage = "copnImgUrl" // 이미지
        case copnTypeGbcd = "ofrTypeGbcd"  //쿠폰유형구분코드

    }
}

struct CouponRequestDTO: Encodable {
    let mcustNo: String?
    let copnGbcd: String?
    let prfrYn: String?
    let ptcoId: String?
    
    
}
