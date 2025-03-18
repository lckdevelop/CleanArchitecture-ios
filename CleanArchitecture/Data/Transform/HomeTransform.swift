//
//  HomeTransform.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/16/25.
//

import Foundation

extension HomeBannerResponse {
    public func toDomain() -> HomeEntity {
        guard let menuList = data?.menuList, menuList.count > 3 else {
            return HomeEntity(
                foodBannerList: [],
                trendBannerList: [],
                noticeBannerList: []
            )
        }
        
        // 팝업&뉴오픈, 트렌드&취향, 현대식품관 투홈 리스트를 합쳐서 하나의 배열로 반환
        let foodBannerList = mapToHomeBannerList(menuList[3].list2)
        let trendBannerList = mapToHomeBannerList(menuList[2].list)
        let noticeBannerList = mapToHomeBannerList(menuList[1].list)

        return HomeEntity(
            foodBannerList: foodBannerList,
            trendBannerList: trendBannerList,
            noticeBannerList: noticeBannerList
        )
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


