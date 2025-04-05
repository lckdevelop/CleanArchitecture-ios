//
//  HomeEntity.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import Foundation


public struct HomeInfo {
    public let stCd: String
    
    public init(stCd: String) {
        self.stCd = stCd
    }
}

public struct HomeEntityList {
    public let list: [HomeEntity]
}

public struct HomeEntity {
    public let foodBannerList: [HomeBanner]
    public let trendBannerList: [HomeBanner]
    public let noticeBannerList: [HomeBanner]
    
    public init(foodBannerList: [HomeBanner], trendBannerList: [HomeBanner], noticeBannerList: [HomeBanner]) {
        self.foodBannerList = foodBannerList
        self.trendBannerList = trendBannerList
        self.noticeBannerList = noticeBannerList
    }
}

public struct HomeBanner: Hashable, Equatable {
    public let image: String
    public let dcRate: String
    public let price: String
    public let link: String
    public let badgeNm: String
    public let place: String
    public let originPrice: String
    public let title: String
    public let descript: String
    
    public init(image: String, dcRate: String, price: String, link: String, badgeNm: String, place: String, originPrice: String, title: String, descript: String) {
        self.image = image
        self.dcRate = dcRate
        self.price = price
        self.link = link
        self.badgeNm = badgeNm
        self.place = place
        self.originPrice = originPrice
        self.title = title
        self.descript = descript
    }
}
