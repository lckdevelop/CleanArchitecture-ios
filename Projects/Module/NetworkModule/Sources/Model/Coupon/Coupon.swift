//
//  Coupon.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import Foundation

public struct CouponRequest: Encodable {
    let mcustNo: String?
    let copnGbcd: String?
    let prfrYn: String?
    let ptcoId: String?
    
    public init(mcustNo: String?, copnGbcd: String?, prfrYn: String?, ptcoId: String?) {
        self.mcustNo = mcustNo
        self.copnGbcd = copnGbcd
        self.prfrYn = prfrYn
        self.ptcoId = ptcoId
    }
}

//struct CouponList: Decodable {
//    let code: String?
//    let message: String?
//    let coupons: [Coupon]?
//    
//    enum CodingKeys: String, CodingKey {
//        case code
//        case message
//        case coupons = "copnList"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        code = try values.decodeIfPresent(String.self, forKey: .code)
//        message = try values.decodeIfPresent(String.self, forKey: .message)
//        coupons = try values.decodeIfPresent([Coupon].self, forKey: .coupons)
//    }
//}
//
//struct Coupon: Decodable, Hashable, Identifiable {
//    var id: String {
//        return "\(ofrId ?? "")-\(campId ?? "")"
//    }
//    let campId: String?
//    let ofrId: String?
//    let name: String?
//    let titleImage: String?
//    let copnTypeGbcd: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case campId = "campId"
//        case ofrId = "ofrId"
//        case name = "copnNm"
//        case titleImage = "copnImgUrl" // 이미지
//        case copnTypeGbcd = "ofrTypeGbcd"  //쿠폰유형구분코드
//        
//    }
//}

// 도메인 모델 정의
public struct CouponListResponse: Decodable {
    public let code: String
    public let message: String
    public let coupons: [CouponDTO]
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
        case coupons = "copnList"
    }
    
    public init(code: String, message: String, coupons: [CouponDTO]) {
        self.code = code
        self.message = message
        self.coupons = coupons
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        coupons = try container.decodeIfPresent([CouponDTO].self, forKey: .coupons) ?? []
    }
    
    
}



public struct CouponDTO: Decodable, Hashable, Identifiable {
    public var id: String {
        return "\(ofrId ?? "")-\(campId ?? "")"
    }
    public let campId: String?
    public let ofrId: String?
    public let name: String?
    public let titleImage: String?
    public let copnTypeGbcd: String?
    
    public init(campId: String?, ofrId: String?, name: String?, titleImage: String?, copnTypeGbcd: String?) {
        self.campId = campId
        self.ofrId = ofrId
        self.name = name
        self.titleImage = titleImage
        self.copnTypeGbcd = copnTypeGbcd
    }
    
    enum CodingKeys: String, CodingKey {
        case campId = "campId"
        case ofrId = "ofrId"
        case name = "copnNm"
        case titleImage = "copnImgUrl" // 이미지
        case copnTypeGbcd = "ofrTypeGbcd"  //쿠폰유형구분코드
        
    }
}
