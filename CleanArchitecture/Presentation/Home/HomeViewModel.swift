//
//  HomeViewModel.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var foodBannerList: [homeBanner]?
    @Published var trendBannerList: [homeBanner]?
    @Published var noticeBannerList: [homeBanner]?
    
    private let useCase: HomeInfoUseCase
    private var cancellables = Set<AnyCancellable>()

    init(homeInfoUseCase: HomeInfoUseCase) {
        self.useCase = homeInfoUseCase
    }
    
    func fetchTohomeBanner() {
        useCase.execute(request: HomeBannerRequest(stCd: "400"))
            .sink { completion in
                switch completion {
                    case .finished:
                        print("✅ 통신 성공")
                    case .failure(let error):
                        print("❌ 통신 실패: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] homeEntity in
                    self?.foodBannerList = homeEntity.foodBannerList
                    self?.trendBannerList = homeEntity.trendBannerList
                    self?.noticeBannerList = homeEntity.noticeBannerList
            }
            .store(in: &cancellables)
    }
    
    func moreTrendBtnTapped() {
        // viewmodel에서 화면 전환을 하나?
        //coordinator.trendDetail(page: .food)
    }
    
    func cancelSubscriptions() {
        cancellables.removeAll()
    }

}
