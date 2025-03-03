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

enum JSONError: Error {
    case badURL
    case networkError
    case decodingError
    case unknown
}

extension HomeRepository: HomeRepositoryInterface {
    func fetchHomeInfo(request: HomeBannerRequest) -> AnyPublisher<HomeEntity, Error> {
        homeService.getHomeInfoList(request: request)
                .compactMap { response -> HomeEntity? in
                    guard let menuList = response.data?.menuList, menuList.count > 3 else { return nil }
                    
                    let selectedMenu1 = menuList[1]
                    let selectedMenu2 = menuList[3]
                    let selectedMenu3 = menuList[3]
                    
                    // 세 개의 리스트를 합쳐서 하나의 배열로 반환
                    return HomeEntity(
                        foodBannerList: mapToHomeBannerList3(selectedMenu3.list2),
                        trendBannerList: mapToHomeBannerList2(selectedMenu2.list1),
                        noticeBannerList: mapToHomeBannerList(selectedMenu1.list)
                    )
                }
                .eraseToAnyPublisher()
    }
}

// 중복 변환 로직을 별도 함수로 분리
private func mapToHomeBannerList(_ list: [HomeBannerResponse.Data.MenuList.List]?) -> [homeBanner] {
    return list?.compactMap { banner in
        homeBanner(
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

// 중복 변환 로직을 별도 함수로 분리
private func mapToHomeBannerList2(_ list: [HomeBannerResponse.Data.MenuList.List1]?) -> [homeBanner] {
    return list?.compactMap { banner in
        homeBanner(
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

// 중복 변환 로직을 별도 함수로 분리
private func mapToHomeBannerList3(_ list: [HomeBannerResponse.Data.MenuList.List2]?) -> [homeBanner] {
    return list?.compactMap { banner in
        homeBanner(
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
//            .map { $0.data?.menuList?[3].list2 ?? [] }
//            .map { list in
//                list.map {
//                    FoodBanner(
//                        image: $0.image ?? "",
//                        dcRate: $0.dcRate ?? "",
//                        price: $0.price ?? "",
//                        link: $0.link ?? "",
//                        badgeNm: $0.badgeNm ?? "",
//                        place: $0.place ?? "",
//                        originPrice: $0.originPrice ?? "",
//                        title: $0.title ?? "",
//                        descript: $0.descript ?? ""
//                    )
//                }
//            }

//            .map { $0.data?.menuList?[3] }
//            .map { menuList in
//                guard let foodBannerList = menuList.list2, // list2를 foodBannerList로 매핑
//                      let trendBannerList = menuList.list,       // list를 trendList로 매핑
//                      let noticeBannerList = menuList.list1 else { // list1을 noticeList로 매핑
//                    return nil
//                }
//
//                    // HomeEntity를 생성하여 반환
//                    return HomeEntity(
//                        foodBannerList: foodBannerList.compactMap { banner in
//                            homeBanner(
//                                image: banner.image ?? "",
//                                dcRate: banner.dcRate ?? "",
//                                price: banner.price ?? "",
//                                link: banner.link ?? "",
//                                badgeNm: banner.badgeNm ?? "",
//                                place: banner.place ?? "",
//                                originPrice: banner.originPrice ?? "",
//                                title: banner.title ?? "",
//                                descript: banner.descript ?? ""
//                            )
//                        },
//                        trendBannerList: trendBannerList.compactMap { banner in
//                            homeBanner(
//                                image: banner.image ?? "",
//                                dcRate: banner.dcRate ?? "",
//                                price: banner.price ?? "",
//                                link: banner.link ?? "",
//                                badgeNm: banner.badgeNm ?? "",
//                                place: banner.place ?? "",
//                                originPrice: banner.originPrice ?? "",
//                                title: banner.title ?? "",
//                                descript: banner.descript ?? ""
//                            )
//                        },
//                        noticeBannerList: noticeBannerList.compactMap { banner in
//                            homeBanner(
//                                image: banner.image ?? "",
//                                dcRate: banner.dcRate ?? "",
//                                price: banner.price ?? "",
//                                link: banner.link ?? "",
//                                badgeNm: banner.badgeNm ?? "",
//                                place: banner.place ?? "",
//                                originPrice: banner.originPrice ?? "",
//                                title: banner.title ?? "",
//                                descript: banner.descript ?? ""
//                            )
//                        }
//                    )
//                }
//
//            .eraseToAnyPublisher()
