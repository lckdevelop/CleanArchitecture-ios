//
//  CultureSearch.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

struct CultureSearchResponse: Decodable {
    let result: String?
    let code: String?
    let data: Data?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case code = "code"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(String.self, forKey: .result)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
    }
    
    struct Data: Decodable {
        let pagePerContents: Int?
        let applyCrsCnt: String?
        let applyCrsList: [ApplyCrsList]?
        let currentPage: Int?
        let searchData: SearchData?
        
        enum CodingKeys: String, CodingKey {
            
            case pagePerContents = "pagePerContents"
            case applyCrsCnt = "applyCrsCnt"
            case applyCrsList = "applyCrsList"
            case currentPage = "currentPage"
            case searchData = "searchData"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            pagePerContents = try values.decodeIfPresent(Int.self, forKey: .pagePerContents)
            if let intValue = try? values.decodeIfPresent(Int.self, forKey: .applyCrsCnt) {
                applyCrsCnt = String(intValue)
            } else {
                applyCrsCnt = try values.decodeIfPresent(String.self, forKey: .applyCrsCnt)
            }
            applyCrsList = try values.decodeIfPresent([ApplyCrsList].self, forKey: .applyCrsList)
            currentPage = try values.decodeIfPresent(Int.self, forKey: .currentPage)
            searchData = try values.decodeIfPresent(SearchData.self, forKey: .searchData)
        }
        
    }

    
    
}

struct SearchData: Decodable {
    let monthEnd: String?
    let giftFlagNm: String?
    let crsCategory: String?
    let crsTy2: String?
    let crsTy1: String?
    let giftFlag: String?
    let monthStart: String?
    let crsTy2Nm: String?
    let crsTy1Nm: String?
    let dayOfWeekNm: String?
    let monthNm: String?
    let crsTimeNm: String?
    let applyStatusNm: String?
    let crsNm: String?
    let dayOfWeek: String?
    let stCd: String?
    let stNm: String?
    let crsEndTime: String?
    let crsStartTime: String?
    let crsCategoryNm: String?
    let applyStatus: String?

    enum CodingKeys: String, CodingKey {
        case monthEnd = "monthEnd"
        case giftFlagNm = "giftFlagNm"
        case crsCategory = "crsCategory"
        case crsTy2 = "crsTy2"
        case crsTy1 = "crsTy1"
        case giftFlag = "giftFlag"
        case monthStart = "monthStart"
        case crsTy2Nm = "crsTy2Nm"
        case crsTy1Nm = "crsTy1Nm"
        case dayOfWeekNm = "dayOfWeekNm"
        case monthNm = "monthNm"
        case crsTimeNm = "crsTimeNm"
        case applyStatusNm = "applyStatusNm"
        case crsNm = "crsNm"
        case dayOfWeek = "dayOfWeek"
        case stCd = "stCd"
        case stNm = "stNm"
        case crsEndTime = "crsEndTime"
        case crsStartTime = "crsStartTime"
        case crsCategoryNm = "crsCategoryNm"
        case applyStatus = "applyStatus"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        monthEnd = try values.decodeIfPresent(String.self, forKey: .monthEnd)
        giftFlagNm = try values.decodeIfPresent(String.self, forKey: .giftFlagNm)
        crsCategory = try values.decodeIfPresent(String.self, forKey: .crsCategory)
        crsTy2 = try values.decodeIfPresent(String.self, forKey: .crsTy2)
        crsTy1 = try values.decodeIfPresent(String.self, forKey: .crsTy1)
        giftFlag = try values.decodeIfPresent(String.self, forKey: .giftFlag)
        monthStart = try values.decodeIfPresent(String.self, forKey: .monthStart)
        crsTy2Nm = try values.decodeIfPresent(String.self, forKey: .crsTy2Nm)
        crsTy1Nm = try values.decodeIfPresent(String.self, forKey: .crsTy1Nm)
        dayOfWeekNm = try values.decodeIfPresent(String.self, forKey: .dayOfWeekNm)
        monthNm = try values.decodeIfPresent(String.self, forKey: .monthNm)
        crsTimeNm = try values.decodeIfPresent(String.self, forKey: .crsTimeNm)
        applyStatusNm = try values.decodeIfPresent(String.self, forKey: .applyStatusNm)
        crsNm = try values.decodeIfPresent(String.self, forKey: .crsNm)
        dayOfWeek = try values.decodeIfPresent(String.self, forKey: .dayOfWeek)
        stCd = try values.decodeIfPresent(String.self, forKey: .stCd)
        stNm = try values.decodeIfPresent(String.self, forKey: .stNm)
        crsEndTime = try values.decodeIfPresent(String.self, forKey: .crsEndTime)
        crsStartTime = try values.decodeIfPresent(String.self, forKey: .crsStartTime)
        crsCategoryNm = try values.decodeIfPresent(String.self, forKey: .crsCategoryNm)
        applyStatus = try values.decodeIfPresent(String.self, forKey: .applyStatus)
    }

}

struct ApplyCrsList: Decodable {
    let lessonNum: String?
    let proCustNo: String?
    let searchCrsStDt: String?
    let stTime: String?
    let calDt3: String?
    let crsCnt: String?
    let applyCntCal: String?
    let isnow: String?
    let stCd: String?
    let quota: String?
    let daytimeTycd: String?
    let crsTy2: String?
    let crsTy1: String?
    let tmCnt: String?
    let imageMobileDesc: String?
    let nickNm: String?
    let closeyn: String?
    let lessonNumChk: String?
    let stNm: String?
    let crsMinDt: String?
    let applyStatus: String?
    let ro: String?
    let waitApplyYn: String?
    let imageMobile: String?
    let crsTy2Nm: String?
    let openChk: String?
    let materialCost: String?
    let crsTy2Ref: String?
    let crsCd: String?
    let crsSqNo: String?
    let isstart: String?
    let crsClass: String?
    let applyCnt: String?
    let imageThumbDesc: String?
    let total: String?
    let partnerQuotaYn: String?
    let crsStDt: String?
    let giftSum: String?
    let crsClDt: String?
    let imageThumb: String?
    let isclose: String?
    let lessonChk: String?
    let waitApplyChk: String?
    let kwdCode: String?
    let sqCd: String?
    let crsTy1Ref: String?
    let crsNm: String?
    let tuition: String?
    let applyStatusNm: String?
    let partnerQuota: String?
    let timeclassinfo: String?
    let strApply: String?

    enum CodingKeys: String, CodingKey {
        case lessonNum = "lessonNum"
        case proCustNo = "proCustNo"
        case searchCrsStDt = "searchCrsStDt"
        case stTime = "stTime"
        case calDt3 = "calDt3"
        case crsCnt = "crsCnt"
        case applyCntCal = "applyCntCal"
        case isnow = "isnow"
        case stCd = "stCd"
        case quota = "quota"
        case daytimeTycd = "daytimeTycd"
        case crsTy2 = "crsTy2"
        case crsTy1 = "crsTy1"
        case tmCnt = "tmCnt"
        case imageMobileDesc = "imageMobileDesc"
        case nickNm = "nickNm"
        case closeyn = "closeyn"
        case lessonNumChk = "lessonNumChk"
        case stNm = "stNm"
        case crsMinDt = "crsMinDt"
        case applyStatus = "applyStatus"
        case ro = "ro"
        case waitApplyYn = "waitApplyYn"
        case imageMobile = "imageMobile"
        case crsTy2Nm = "crsTy2Nm"
        case openChk = "openChk"
        case materialCost = "materialCost"
        case crsTy2Ref = "crsTy2Ref"
        case crsCd = "crsCd"
        case crsSqNo = "crsSqNo"
        case isstart = "isstart"
        case crsClass = "crsClass"
        case applyCnt = "applyCnt"
        case imageThumbDesc = "imageThumbDesc"
        case total = "total"
        case partnerQuotaYn = "partnerQuotaYn"
        case crsStDt = "crsStDt"
        case giftSum = "giftSum"
        case crsClDt = "crsClDt"
        case imageThumb = "imageThumb"
        case isclose = "isclose"
        case lessonChk = "lessonChk"
        case waitApplyChk = "waitApplyChk"
        case kwdCode = "kwdCode"
        case sqCd = "sqCd"
        case crsTy1Ref = "crsTy1Ref"
        case crsNm = "crsNm"
        case tuition = "tuition"
        case applyStatusNm = "applyStatusNm"
        case partnerQuota = "partnerQuota"
        case timeclassinfo = "timeclassinfo"
        case strApply = "strApply"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lessonNum = try values.decodeIfPresent(String.self, forKey: .lessonNum)
        proCustNo = try values.decodeIfPresent(String.self, forKey: .proCustNo)
        searchCrsStDt = try values.decodeIfPresent(String.self, forKey: .searchCrsStDt)
        stTime = try values.decodeIfPresent(String.self, forKey: .stTime)
        calDt3 = try values.decodeIfPresent(String.self, forKey: .calDt3)
        crsCnt = try values.decodeIfPresent(String.self, forKey: .crsCnt)
        applyCntCal = try values.decodeIfPresent(String.self, forKey: .applyCntCal)
        isnow = try values.decodeIfPresent(String.self, forKey: .isnow)
        stCd = try values.decodeIfPresent(String.self, forKey: .stCd)
        quota = try values.decodeIfPresent(String.self, forKey: .quota)
        daytimeTycd = try values.decodeIfPresent(String.self, forKey: .daytimeTycd)
        crsTy2 = try values.decodeIfPresent(String.self, forKey: .crsTy2)
        crsTy1 = try values.decodeIfPresent(String.self, forKey: .crsTy1)
        tmCnt = try values.decodeIfPresent(String.self, forKey: .tmCnt)
        imageMobileDesc = try values.decodeIfPresent(String.self, forKey: .imageMobileDesc)
        nickNm = try values.decodeIfPresent(String.self, forKey: .nickNm)
        closeyn = try values.decodeIfPresent(String.self, forKey: .closeyn)
        lessonNumChk = try values.decodeIfPresent(String.self, forKey: .lessonNumChk)
        stNm = try values.decodeIfPresent(String.self, forKey: .stNm)
        crsMinDt = try values.decodeIfPresent(String.self, forKey: .crsMinDt)
        applyStatus = try values.decodeIfPresent(String.self, forKey: .applyStatus)
        ro = try values.decodeIfPresent(String.self, forKey: .ro)
        waitApplyYn = try values.decodeIfPresent(String.self, forKey: .waitApplyYn)
        imageMobile = try values.decodeIfPresent(String.self, forKey: .imageMobile)
        crsTy2Nm = try values.decodeIfPresent(String.self, forKey: .crsTy2Nm)
        openChk = try values.decodeIfPresent(String.self, forKey: .openChk)
        materialCost = try values.decodeIfPresent(String.self, forKey: .materialCost)
        crsTy2Ref = try values.decodeIfPresent(String.self, forKey: .crsTy2Ref)
        crsCd = try values.decodeIfPresent(String.self, forKey: .crsCd)
        crsSqNo = try values.decodeIfPresent(String.self, forKey: .crsSqNo)
        isstart = try values.decodeIfPresent(String.self, forKey: .isstart)
        crsClass = try values.decodeIfPresent(String.self, forKey: .crsClass)
        applyCnt = try values.decodeIfPresent(String.self, forKey: .applyCnt)
        imageThumbDesc = try values.decodeIfPresent(String.self, forKey: .imageThumbDesc)
        total = try values.decodeIfPresent(String.self, forKey: .total)
        partnerQuotaYn = try values.decodeIfPresent(String.self, forKey: .partnerQuotaYn)
        crsStDt = try values.decodeIfPresent(String.self, forKey: .crsStDt)
        giftSum = try values.decodeIfPresent(String.self, forKey: .giftSum)
        crsClDt = try values.decodeIfPresent(String.self, forKey: .crsClDt)
        imageThumb = try values.decodeIfPresent(String.self, forKey: .imageThumb)
        isclose = try values.decodeIfPresent(String.self, forKey: .isclose)
        lessonChk = try values.decodeIfPresent(String.self, forKey: .lessonChk)
        waitApplyChk = try values.decodeIfPresent(String.self, forKey: .waitApplyChk)
        kwdCode = try values.decodeIfPresent(String.self, forKey: .kwdCode)
        sqCd = try values.decodeIfPresent(String.self, forKey: .sqCd)
        crsTy1Ref = try values.decodeIfPresent(String.self, forKey: .crsTy1Ref)
        crsNm = try values.decodeIfPresent(String.self, forKey: .crsNm)
        tuition = try values.decodeIfPresent(String.self, forKey: .tuition)
        applyStatusNm = try values.decodeIfPresent(String.self, forKey: .applyStatusNm)
        partnerQuota = try values.decodeIfPresent(String.self, forKey: .partnerQuota)
        timeclassinfo = try values.decodeIfPresent(String.self, forKey: .timeclassinfo)
        strApply = try values.decodeIfPresent(String.self, forKey: .strApply)
    }

}
