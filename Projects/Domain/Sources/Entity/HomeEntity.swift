//
//  HomeEntity.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import Foundation

public struct HomeBannerRequest: Encodable {
    var stCd: String?
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

public protocol HomeBannerListProtocol {
    var image: String? { get }
    var dcRate: String? { get }
    var price: String? { get }
    var link: String? { get }
    var badgeNm: String? { get }
    var place: String? { get }
    var originPrice: String? { get }
    var title: String? { get }
    var descript: String? { get }
}

public struct HomeBanner: Hashable, Equatable {
    let image: String
    let dcRate: String
    let price: String
    let link: String
    let badgeNm: String
    let place: String
    let originPrice: String
    let title: String
    let descript: String
    
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
