//
//  LectureSearchResultViewModel.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import RxSwift
import RxRelay

protocol LectureSearchViewModelInput {
    func searchCultureList()
}

protocol LectureSearchViewModelOutput {
    var lectureList: BehaviorRelay<[CultureLecture]> { get }
    var errors: BehaviorRelay<String> { get }
}

protocol CultureCenterViewModelProtocol: LectureSearchViewModelInput, LectureSearchViewModelOutput {}

final class CultureCenterViewModel: CultureCenterViewModelProtocol {
    
    private let cultureUseCase: CultureUseCaseProtocol
    
    var lectureList = BehaviorRelay<[CultureLecture]>(value: [])
    var errors = BehaviorRelay<String>(value: "")
        
    init(cultureUseCase: CultureUseCaseProtocol) {
        self.cultureUseCase = cultureUseCase
    }
    
    public func searchCultureList() {
        // 선택하는 화면이 없어 임시로 model 세팅
        let cultureSearchResultRequest = CultureSearchRequest(stCd: "ALL",
                                                 sqCd: "",
                                                 crsTy1: "ALL",
                                                 crsTy2: "ALL",
                                                 crsCategory: "ALL",
                                                 dayOfWeek: "ALL",
                                                 crsStartTime: "0700",
                                                 crsEndTime: "2100",
                                                 crsNm: "",
                                                 applyStatus: "ALL",
                                                 currentPage: "1",
                                                 countPerPage: "20",
                                                 monthStart: "20250105",
                                                 monthEnd: "20251231",
                                                 giftFlag: "")
        
        let group = DispatchGroup()
        var searchLectureList = [CultureLecture]()
        var errorList = [Error]()
        
        
        group.enter()
        cultureUseCase.fetchCultureList(cultureSearchRequest: cultureSearchResultRequest) { result in
            switch result {
            case .success(let model):
                searchLectureList.append(contentsOf: model)
            case .failure(let error):
                errorList.append(error)
            }
            group.leave()
        }
        
        
        group.notify(queue: .main) {
            if !errorList.isEmpty {
                self.errors.accept(NSLocalizedString("Failed loading data", comment: ""))
            } else {
                self.lectureList.accept(searchLectureList)
            }
        }
    }
}

