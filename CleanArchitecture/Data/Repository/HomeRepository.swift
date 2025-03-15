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
                    guard let menuList = response.data?.menuList, menuList.count > 3 else {
                        return Fail(error: NSError(domain: "MenuList Index Error", code: 0, userInfo: nil))
                            .eraseToAnyPublisher()
                    }
                    
                    // 팝업&뉴오픈, 트렌드&취향, 현대식품관 투홈 리스트를 합쳐서 하나의 배열로 반환
                    let selectedMenu1 = menuList[1]
                    let selectedMenu2 = menuList[2]
                    let selectedMenu3 = menuList[3]
                    
                    let foodBannerList = self.mapToHomeBannerList(selectedMenu3.list2)
                    let trendBannerList = self.mapToHomeBannerList(selectedMenu2.list)
                    let noticeBannerList = self.mapToHomeBannerList(selectedMenu1.list)
                        
                    let homeEntity = HomeEntity(
                        foodBannerList: foodBannerList,
                        trendBannerList: trendBannerList,
                        noticeBannerList: noticeBannerList
                    )
                    
                    return Just(homeEntity)
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


