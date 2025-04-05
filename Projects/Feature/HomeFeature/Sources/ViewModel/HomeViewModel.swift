//
//  HomeViewModel.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import SwiftUI
import Combine
import Domain

public class HomeViewModel: ObservableObject {
    @Published var foodBannerList: [HomeBanner]?
    @Published var trendBannerList: [HomeBanner]?
    @Published var noticeBannerList: [HomeBanner]?
    
    private let homeUseCase: HomeUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    public init(homeUseCase: HomeUseCaseProtocol) {
        self.homeUseCase = homeUseCase
    }
    
    public func fetchHomeBanner() {
        homeUseCase.fetchHomeBanners(request: HomeBannerRequest(stCd: "400"))
            .sink { completion in
                switch completion {
                    case .finished:
                        print("통신 성공")
                    case .failure(let error):
                        print("통신 실패: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] homeEntity in
                self?.foodBannerList = Array(homeEntity.foodBannerList.prefix(6))
                self?.trendBannerList = Array(homeEntity.trendBannerList.prefix(4))
                self?.noticeBannerList = homeEntity.noticeBannerList
            }
            .store(in: &cancellables)
    }
    
    func cancelSubscriptions() {
        cancellables.removeAll()
    }

}
