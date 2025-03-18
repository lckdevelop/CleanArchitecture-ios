//
//  HomeEntity.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import Foundation

struct HomeEntityList {
    let list: [HomeEntity]
}

struct HomeEntity {
    let foodBannerList: [HomeBanner]
    let trendBannerList: [HomeBanner]
    let noticeBannerList: [HomeBanner]
}

protocol HomeBannerListProtocol {
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

extension HomeBannerResponse.Data.MenuList.List: HomeBannerListProtocol {}
extension HomeBannerResponse.Data.MenuList.List2: HomeBannerListProtocol {}

struct HomeBanner: Hashable, Equatable {
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
