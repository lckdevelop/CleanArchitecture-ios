//
//  DefaultCultureSearchResultRepository.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import RxSwift
import RxRelay
import RxDataSources

final class DefaultCultureSearchResultRepository {
    
    private let cultureSearchService: CultureSearchServiceProtocol
    
    init(cultureSearchService: CultureSearchServiceProtocol) {
        self.cultureSearchService = cultureSearchService
    }
}

extension DefaultCultureSearchResultRepository: CultureSearchResultRepository {
    
    func fetchSearchResult(request: CultureSearchRequest,
                          completion: @escaping (Result<[CultureLecture], Error>) -> Void) {
        cultureSearchService.getCultureLectureSearchList(request: request) { result in
            switch result {
            case .success(let entity):
                var searchLectureList:[CultureLecture] = []
                
                if let applyCrsList = entity.data?.applyCrsList {
                    for applyCrs in applyCrsList {
                        searchLectureList.append(CultureLecture(lessonNum: applyCrs.lessonNum,
                                                             proCustNo: applyCrs.proCustNo,
                                                             searchCrsStDt: applyCrs.searchCrsStDt,
                                                             stTime: applyCrs.stTime,
                                                             calDt3: applyCrs.calDt3,
                                                             crsCnt: applyCrs.crsCnt,
                                                             applyCntCal: applyCrs.applyCntCal,
                                                             isnow: applyCrs.isnow,
                                                             stCd: applyCrs.stCd,
                                                             quota: applyCrs.quota,
                                                             daytimeTycd: applyCrs.daytimeTycd,
                                                             crsTy2: applyCrs.crsTy2,
                                                             crsTy1: applyCrs.crsTy1,
                                                             tmCnt: applyCrs.tmCnt,
                                                             imageMobileDesc: applyCrs.imageMobileDesc,
                                                             nickNm: applyCrs.nickNm,
                                                             closeyn: applyCrs.closeyn,
                                                             lessonNumChk: applyCrs.lessonNumChk,
                                                             stNm: applyCrs.stNm,
                                                             crsMinDt: applyCrs.crsMinDt,
                                                             applyStatus: applyCrs.applyStatus,
                                                             ro: applyCrs.ro,
                                                             waitApplyYn: applyCrs.waitApplyYn,
                                                             imageMobile: applyCrs.imageMobile,
                                                             crsTy2Nm: applyCrs.crsTy2Nm,
                                                             openChk: applyCrs.openChk,
                                                             materialCost: applyCrs.materialCost,
                                                             crsTy2Ref: applyCrs.crsTy2Ref,
                                                             crsCd: applyCrs.crsCd,
                                                             crsSqNo: applyCrs.crsSqNo,
                                                             isstart: applyCrs.isstart,
                                                             crsClass: applyCrs.crsClass,
                                                             applyCnt: applyCrs.applyCnt,
                                                             imageThumbDesc: applyCrs.imageThumbDesc,
                                                             total: applyCrs.total,
                                                             partnerQuotaYn: applyCrs.partnerQuotaYn,
                                                             crsStDt: applyCrs.crsStDt,
                                                             giftSum: applyCrs.giftSum,
                                                             crsClDt: applyCrs.crsClDt,
                                                             imageThumb: applyCrs.imageThumb,
                                                             isclose: applyCrs.isclose,
                                                             lessonChk: applyCrs.lessonChk,
                                                             waitApplyChk: applyCrs.waitApplyChk,
                                                             kwdCode: applyCrs.kwdCode,
                                                             sqCd: applyCrs.sqCd,
                                                             crsTy1Ref: applyCrs.crsTy1Ref,
                                                             crsNm: applyCrs.crsNm,
                                                             tuition: applyCrs.tuition,
                                                             applyStatusNm: applyCrs.applyStatusNm,
                                                             partnerQuota: applyCrs.partnerQuota,
                                                             timeclassinfo: applyCrs.timeclassinfo,
                                                             strApply: applyCrs.strApply)
                        )
                    }
                }
                completion(.success(searchLectureList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
}
