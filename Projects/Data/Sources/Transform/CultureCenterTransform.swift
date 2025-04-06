//
//  CultureCenterTransform.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/17/25.
//

import Foundation
import Domain
import NetworkModule

extension CultureSearch {
    public func toData() -> CultureSearchRequest {
        return CultureSearchRequest(
            stCd: self.stCd,
            sqCd: self.sqCd,
            crsTy1: self.crsTy1,
            crsTy2: self.crsTy2,
            crsCategory: self.crsCategory,
            dayOfWeek: self.dayOfWeek,
            crsStartTime: self.crsStartTime,
            crsEndTime: self.crsEndTime,
            crsNm: self.crsNm,
            applyStatus: self.applyStatus,
            currentPage: self.currentPage,
            countPerPage: self.countPerPage,
            monthStart: self.monthStart,
            monthEnd: self.monthEnd,
            giftFlag: self.giftFlag
        )
    }
}

extension ApplyCrsList {
    public func toDomain() -> CultureLectureEntity {
        return CultureLectureEntity.init(applyCntCal: self.applyCntCal,
                                   nickNm: self.nickNm,
                                   crsNm: self.crsNm,
                                   tuition: self.tuition,
                                   timeclassinfo: self.timeclassinfo)
    }
}


