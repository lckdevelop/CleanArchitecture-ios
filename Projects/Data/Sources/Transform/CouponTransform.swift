//
//  CouponTransform.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/17/25.
//

import Foundation
import Domain
import NetworkModule

extension CouponRequestDTO {
    public func toData() -> CouponRequest {
        return CouponRequest(
            mcustNo: self.mcustNo,
            copnGbcd: self.copnGbcd,
            prfrYn: self.prfrYn,
            ptcoId: self.ptcoId
        )
    }
}

extension CouponDTO {
    public func toDomain() -> CouponEntity {
        return CouponEntity(
            id: self.id, campId: self.campId ?? "", ofrId: self.ofrId ?? "", name: self.name ?? "", titleImage: self.titleImage, couponType: CouponEntity.CouponType(rawValue: self.copnTypeGbcd)
        )
    }
}

