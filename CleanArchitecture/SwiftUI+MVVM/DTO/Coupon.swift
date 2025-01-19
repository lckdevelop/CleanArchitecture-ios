//
//  Coupon.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import Foundation

struct Coupon: Decodable, Hashable {
    let campId: String
    let name: String
    let titleImage: String?
    let isDownload: String
    let copnEnableYn: String
    let dnStartDate: String
    let dnEndDate: String
    let validStartDate: String?
    let validEndDate: String?
    let useText: String?
    let noteText: String?
    let copnNo: String?
    let shrCopnNo: String?
    let endDays: Int?
    let custAvalPnt: Int?
    let famtPnt: Int?
    let pwdUseYn: String
    let copnTypeGbcd: String?
    let ptcoId: String?
    let ptcoNm: String?
    let ptcochid: String?
    let copnStatGbcd: String?
    let copnVlidTermGbcd: String?

    enum CodingKeys: String, CodingKey {
        case campId = "campId"
        case name = "copnNm"
        case titleImage = "copnImgUrl" // 이미지
        case isDownload = "copnDwldYn" // 다운로드 여부
        case copnEnableYn = "copnEnableYn" // 사용가능 여부
        case dnStartDate = "campStrtDt" // 다운 가능 시작일
        case dnEndDate = "campEndDt" // 다운 가능 마지막일
        case validStartDate = "copnVlidStrtDt" // 유효 기간 시작일
        case validEndDate = "copnVlidEndDt" // 유효 기간 마지막일
        case useText = "copnAlarmCntn01" // 사용처, 사용방법
        case noteText = "copnAlarmCntn02" // 유의사항
        case copnNo = "copnNo" //쿠폰번호
        case shrCopnNo // ofrTypeGbcd = 17(외부연동쿠폰) & 다사용 쿠폰일경우 노출되는 쿠폰번호
        case endDays = "copnPblcAftEndDys" // 쿠폰사용가능 종료일 수
        case custAvalPnt // 보유 포인트
        case famtPnt // 사용 포인트
        case pwdUseYn
        case copnTypeGbcd = "ofrTypeGbcd"  //쿠폰유형구분코드
        case ptcoId = "ptcoId"
        case ptcoNm = "ptcoNm"
        case ptcochid = "ptcochid"
        case copnStatGbcd = "copnStatGbcd" //[01] 발급, [02] 사용, [03]: 회수
        case copnVlidTermGbcd = "copnVlidTermGbcd" //
    }
}

struct CouponRequestDTO: Encodable {
    let copnGbcd: String?
    let prfrYn: String?
    let ptcoId: String?

    
}
