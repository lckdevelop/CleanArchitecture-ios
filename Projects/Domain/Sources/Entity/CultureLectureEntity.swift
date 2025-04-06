//
//  CultureLectureEntity.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

public struct CultureSearch {
    public let stCd: String?
    public let sqCd: String?
    public let crsTy1: String?
    public let crsTy2: String?
    public let crsCategory: String?
    public let dayOfWeek: String?
    public let crsStartTime: String?
    public let crsEndTime: String?
    public let crsNm: String?
    public let applyStatus: String?
    public let currentPage: String?
    public let countPerPage: String?
    public let monthStart: String?
    public let monthEnd: String?
    public let giftFlag: String?
    
    public init(stCd: String?, sqCd: String?, crsTy1: String?, crsTy2: String?, crsCategory: String?, dayOfWeek: String?, crsStartTime: String?, crsEndTime: String?, crsNm: String?, applyStatus: String?, currentPage: String?, countPerPage: String?, monthStart: String?, monthEnd: String?, giftFlag: String?) {
        self.stCd = stCd
        self.sqCd = sqCd
        self.crsTy1 = crsTy1
        self.crsTy2 = crsTy2
        self.crsCategory = crsCategory
        self.dayOfWeek = dayOfWeek
        self.crsStartTime = crsStartTime
        self.crsEndTime = crsEndTime
        self.crsNm = crsNm
        self.applyStatus = applyStatus
        self.currentPage = currentPage
        self.countPerPage = countPerPage
        self.monthStart = monthStart
        self.monthEnd = monthEnd
        self.giftFlag = giftFlag
    }
}

public struct CultureLectureEntity {
    public let applyCntCal: String?
    public let nickNm: String?
    public let crsNm: String?
    public let tuition: String?
    public let timeclassinfo: String?
    
    public init(applyCntCal: String?, nickNm: String?, crsNm: String?, tuition: String?, timeclassinfo: String?) {
        self.applyCntCal = applyCntCal
        self.nickNm = nickNm
        self.crsNm = crsNm
        self.tuition = tuition
        self.timeclassinfo = timeclassinfo
    }
}
