//
//  CouponEntity.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import Foundation

// 도메인 모델 정의
struct CouponEntityList: Decodable {
    let code: String
    let message: String
    let coupons: [CouponEntity]
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
        case coupons = "copnList"
    }
    
    init(code: String, message: String, coupons: [CouponEntity]) {
        self.code = code
        self.message = message
        self.coupons = coupons
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        coupons = try container.decodeIfPresent([CouponEntity].self, forKey: .coupons) ?? []
    }
}

struct CouponEntity: Identifiable, Hashable, Decodable {
    let id: String
    let campId: String
    let ofrId: String
    let name: String
    let titleImage: String?
    let couponType: CouponType
    
    enum CodingKeys: String, CodingKey {
        case campId = "campId"
        case ofrId = "ofrId"
        case name = "copnNm"
        case titleImage = "copnImgUrl"
        case couponType = "ofrTypeGbcd"
    }
    
    init(id: String, campId: String, ofrId: String, name: String, titleImage: String?, couponType: CouponType) {
        self.id = id
        self.campId = campId
        self.ofrId = ofrId
        self.name = name
        self.titleImage = titleImage
        self.couponType = couponType
    }
    
    init(from decoder: Decoder) throws {
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
    var isCampaignCoupon: Bool {
        return !campId.isEmpty
    }
    
    // 쿠폰 타입에 따른 열거형
    enum CouponType: String, Decodable {
        case coupon = "01"
        case pluspoint = "02"
        case unknown
        
        init(rawValue: String?) {
            switch rawValue {
            case "01": self = .coupon
            case "02": self = .pluspoint
            default: self = .unknown
            }
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            self = CouponType(rawValue: rawValue)
        }
    }
} 