//
//  CultureLecture.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

struct CultureSearchRequest: Encodable {
    var stCd: String?
    var sqCd: String?
    var crsTy1: String?
    var crsTy2: String?
    var crsCategory: String?
    var dayOfWeek: String?
    var crsStartTime: String?
    var crsEndTime: String?
    var crsNm: String?
    var applyStatus: String?
    var currentPage: String?
    var countPerPage: String?
    var monthStart: String?
    var monthEnd: String?
    var giftFlag: String?
}

struct CultureLecture {
    let applyCntCal: String?
    let nickNm: String?
    let crsNm: String?
    let tuition: String?
    let timeclassinfo: String?
}
