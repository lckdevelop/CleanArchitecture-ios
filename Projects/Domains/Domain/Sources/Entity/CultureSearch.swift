//
//  CultureSearch.swift
//  Domain
//
//  Created by Chaekyeong Lee on 2/2/25.
//

import Foundation

public struct CultureSearchRequest {
    public var stCd: String?
    public var sqCd: String?
    public var crsTy1: String?
    public var crsTy2: String?
    public var crsCategory: String?
    public var dayOfWeek: String?
    public var crsStartTime: String?
    public var crsEndTime: String?
    public var crsNm: String?
    public var applyStatus: String?
    public var currentPage: String?
    public var countPerPage: String?
    public var monthStart: String?
    public var monthEnd: String?
    public var giftFlag: String?
    
    public init(stCd: String? = nil,
                sqCd: String? = nil,
                crsTy1: String? = nil,
                crsTy2: String? = nil,
                crsCategory: String? = nil,
                dayOfWeek: String? = nil,
                crsStartTime: String? = nil,
                crsEndTime: String? = nil,
                crsNm: String? = nil,
                applyStatus: String? = nil,
                currentPage: String? = nil,
                countPerPage: String? = nil,
                monthStart: String? = nil,
                monthEnd: String? = nil,
                giftFlag: String? = nil)
    {
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
