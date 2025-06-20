//
//  CouponEntity.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import Foundation

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

// 도메인 모델 정의
public struct CouponEntityList: Decodable {
    public let code: String
    public let message: String
    public let coupons: [CouponEntity]
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
        case coupons = "copnList"
    }
    
    public init(code: String, message: String, coupons: [CouponEntity]) {
        self.code = code
        self.message = message
        self.coupons = coupons
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        coupons = try container.decodeIfPresent([CouponEntity].self, forKey: .coupons) ?? []
    }
}

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

struct Coupon: Decodable, Hashable, Identifiable {
    var id: String {
        return "\(ofrId ?? "")-\(campId ?? "")"
    }
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

public struct CouponEntity: Identifiable, Hashable, Decodable {
    public let id: String
    public let campId: String
    public let ofrId: String
    public let name: String
    public let titleImage: String?
    public let couponType: CouponType
    
    enum CodingKeys: String, CodingKey {
        case campId = "campId"
        case ofrId = "ofrId"
        case name = "copnNm"
        case titleImage = "copnImgUrl"
        case couponType = "ofrTypeGbcd"
    }
    
    public init(id: String, campId: String, ofrId: String, name: String, titleImage: String?, couponType: CouponType) {
        self.id = id
        self.campId = campId
        self.ofrId = ofrId
        self.name = name
        self.titleImage = titleImage
        self.couponType = couponType
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        campId = try container.decodeIfPresent(String.self, forKey: .campId) ?? ""
        ofrId = try container.decodeIfPresent(String.self, forKey: .ofrId) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        titleImage = try container.decodeIfPresent(String.self, forKey: .titleImage)
        
        let typeString = try container.decodeIfPresent(String.self, forKey: .couponType)
        couponType = CouponType(rawValue: typeString)
        
        id = "\(ofrId)-\(campId)"
    }
    
    // 비즈니스 로직 예시
    public var isCampaignCoupon: Bool {
        return !campId.isEmpty
    }
    
    // 쿠폰 타입에 따른 열거형
    public enum CouponType: String, Decodable {
        case coupon = "01"
        case pluspoint = "02"
        case unknown
        
        public init(rawValue: String?) {
            switch rawValue {
            case "01": self = .coupon
            case "02": self = .pluspoint
            default: self = .unknown
            }
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            self = CouponType(rawValue: rawValue)
        }
    }
} 
