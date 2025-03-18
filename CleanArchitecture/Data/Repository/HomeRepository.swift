//
//  HomeRepository.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import Foundation
import Combine

final class HomeRepository {
    private let homeService: HomeServiceProtocol

    init(homeService: HomeServiceProtocol) {
        self.homeService = homeService
    }
}

extension HomeRepository: HomeRepositoryInterface {
    // 팝업&뉴오픈, 트렌드&취향, 현대식품관 투홈 리스트를 합쳐서 하나의 배열로 반환
    func fetchHomeInfo(request: HomeBannerRequest) -> AnyPublisher<HomeEntity, Error> {
        homeService.fetchHomeInfoList(request: request)
            .flatMap { response -> AnyPublisher<HomeEntity, Error> in
                    return Just(response.toDomain())
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    private func mapToHomeBannerList<T>(_ list: [T]?) -> [HomeBanner] where T: HomeBannerListProtocol {
        return list?.compactMap { banner in
            HomeBanner(
                image: banner.image ?? "",
                dcRate: banner.dcRate ?? "",
                price: banner.price ?? "",
                link: banner.link ?? "",
                badgeNm: banner.badgeNm ?? "",
                place: banner.place ?? "",
                originPrice: banner.originPrice ?? "",
                title: banner.title ?? "",
                descript: banner.descript ?? ""
            )
        } ?? []
    }
}


