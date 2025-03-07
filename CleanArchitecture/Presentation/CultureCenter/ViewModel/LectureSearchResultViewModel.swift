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
    func didSearch()
}

protocol LectureSearchViewModelOutput {
    var lectureList: BehaviorRelay<[CultureLecture]> { get }
    var errors: BehaviorRelay<String> { get }
}

protocol LectureSearchResultViewModel: LectureSearchViewModelInput, LectureSearchViewModelOutput {}

final class DefaultLectureSearchResultViewModel: LectureSearchResultViewModel {
    private let useCase: CultureSearchListUseCase
    
    var lectureList = BehaviorRelay<[CultureLecture]>(value: [])
    var errors = BehaviorRelay<String>(value: "")
        
    init(fetchCultureSearchUsecase: CultureSearchListUseCase) {
        self.useCase = fetchCultureSearchUsecase
    }
    
    private func load() {
        let cultureSearchResultRequestDTO = CultureSearchRequest(stCd: "ALL",
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
        useCase.execute(lectureSearchFilter: cultureSearchResultRequestDTO) { result in
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


extension DefaultLectureSearchResultViewModel {
    func didSearch() {
        load()
    }
}
