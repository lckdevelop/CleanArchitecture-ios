//
//  LectureSearchResultViewModel.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Combine
import Domain

protocol LectureSearchViewModelInput {
    func searchCultureList()
}

protocol LectureSearchViewModelOutput {
    var lectureListPublisher: AnyPublisher<[CultureLecture], Never> { get }
    var errorPublisher: AnyPublisher<String, Never> { get }
    var lectureListValue: [CultureLecture] { get }
}

protocol CultureCenterViewModelProtocol: LectureSearchViewModelInput, LectureSearchViewModelOutput {}

// MARK: - ViewModel

public final class CultureCenterViewModel: CultureCenterViewModelProtocol {
    
    private let cultureUseCase: CultureUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    // Combine Subjects
    private let lectureListSubject = CurrentValueSubject<[CultureLecture], Never>([])
    private let errorSubject = PassthroughSubject<String, Never>()
    
    // Output
    public var lectureListPublisher: AnyPublisher<[CultureLecture], Never> {
        lectureListSubject.eraseToAnyPublisher()
    }

    public var errorPublisher: AnyPublisher<String, Never> {
        errorSubject.eraseToAnyPublisher()
    }
    
    // Init
    public init(cultureUseCase: CultureUseCaseProtocol) {
        self.cultureUseCase = cultureUseCase
    }
    
    // 추가: 읽기 전용 computed property
    public var lectureListValue: [CultureLecture] {
        lectureListSubject.value
    }
    
    // MARK: - Search Logic
    
    public func searchCultureList() {
        let request = CultureSearchRequest(
            stCd: "ALL",
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
            giftFlag: ""
        )
        
        cultureUseCase.fetchCultureList(cultureSearchRequest: request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure = completion {
                    self?.errorSubject.send(NSLocalizedString("Failed loading data", comment: ""))
                }
            } receiveValue: { [weak self] lectures in
                self?.lectureListSubject.send(lectures)
            }
            .store(in: &cancellables)
    }
}
