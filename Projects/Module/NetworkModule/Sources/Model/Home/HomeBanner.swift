//
//  HomeBanner.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import Foundation

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

public struct HomeBannerRequest: Encodable {
    public var stCd: String?
    
    public init(stCd: String?) {
        self.stCd = stCd
    }
}

public struct HomeBannerResponse: Decodable {
    let result: String?
    let code: String?
    public let data: Data?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case code = "code"
        case data = "data"
        case message = "message"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(String.self, forKey: .result)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
    public struct Data: Decodable {
        public let menuList: [MenuList]?

        enum CodingKeys: String, CodingKey {
            case menuList = "menuList"
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            menuList = try values.decodeIfPresent([MenuList].self, forKey: .menuList)
        }
        
        public struct MenuList: Decodable {
            let list1: [List1]?
            let menuNm2: String?
            let menuNm1: String?
            let menuLink1: String?
            public let list2: [List2]?
            let menuLink2: String?
            let sort: Int?
            let type: String?
            let title: String?
            public let list: [List]?
            let menuLink: String?

            enum CodingKeys: String, CodingKey {
                case list1 = "list1"
                case menuNm2 = "menuNm2"
                case menuNm1 = "menuNm1"
                case menuLink1 = "menuLink1"
                case list2 = "list2"
                case menuLink2 = "menuLink2"
                case sort = "sort"
                case type = "type"
                case title = "title"
                case list = "list"
                case menuLink = "menuLink"
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                list1 = try values.decodeIfPresent([List1].self, forKey: .list1)
                menuNm2 = try values.decodeIfPresent(String.self, forKey: .menuNm2)
                menuNm1 = try values.decodeIfPresent(String.self, forKey: .menuNm1)
                menuLink1 = try values.decodeIfPresent(String.self, forKey: .menuLink1)
                list2 = try values.decodeIfPresent([List2].self, forKey: .list2)
                menuLink2 = try values.decodeIfPresent(String.self, forKey: .menuLink2)
                sort = try values.decodeIfPresent(Int.self, forKey: .sort)
                type = try values.decodeIfPresent(String.self, forKey: .type)
                title = try values.decodeIfPresent(String.self, forKey: .title)
                list = try values.decodeIfPresent([List].self, forKey: .list)
                menuLink = try values.decodeIfPresent(String.self, forKey: .menuLink)
            }
            
            public struct List: Decodable, HomeBannerListProtocol {
                public let image: String?
                public let dcRate: String?
                public let price: String?
                public let link: String?
                public let badgeNm: String?
                public let place: String?
                public let originPrice: String?
                public let title: String?
                public let descript: String?

                enum CodingKeys: String, CodingKey {

                    case image = "image"
                    case dcRate = "dcRate"
                    case price = "price"
                    case link = "link"
                    case badgeNm = "badgeNm"
                    case place = "place"
                    case originPrice = "originPrice"
                    case title = "title"
                    case descript = "descript"
                }

                public init(from decoder: Decoder) throws {
                    let values = try decoder.container(keyedBy: CodingKeys.self)
                    image = try values.decodeIfPresent(String.self, forKey: .image)
                    dcRate = try values.decodeIfPresent(String.self, forKey: .dcRate)
                    price = try values.decodeIfPresent(String.self, forKey: .price)
                    link = try values.decodeIfPresent(String.self, forKey: .link)
                    badgeNm = try values.decodeIfPresent(String.self, forKey: .badgeNm)
                    place = try values.decodeIfPresent(String.self, forKey: .place)
                    originPrice = try values.decodeIfPresent(String.self, forKey: .originPrice)
                    title = try values.decodeIfPresent(String.self, forKey: .title)
                    descript = try values.decodeIfPresent(String.self, forKey: .descript)
                }
            }
            
            struct List1: Decodable {
                let image: String?
                let dcRate: String?
                let price: String?
                let link: String?
                let badgeNm: String?
                let place: String?
                let originPrice: String?
                let title: String?
                let descript: String?

                enum CodingKeys: String, CodingKey {
                    case image = "image"
                    case dcRate = "dcRate"
                    case price = "price"
                    case link = "link"
                    case badgeNm = "badgeNm"
                    case place = "place"
                    case originPrice = "originPrice"
                    case title = "title"
                    case descript = "descript"
                }

                init(from decoder: Decoder) throws {
                    let values = try decoder.container(keyedBy: CodingKeys.self)
                    image = try values.decodeIfPresent(String.self, forKey: .image)
                    dcRate = try values.decodeIfPresent(String.self, forKey: .dcRate)
                    price = try values.decodeIfPresent(String.self, forKey: .price)
                    link = try values.decodeIfPresent(String.self, forKey: .link)
                    badgeNm = try values.decodeIfPresent(String.self, forKey: .badgeNm)
                    place = try values.decodeIfPresent(String.self, forKey: .place)
                    originPrice = try values.decodeIfPresent(String.self, forKey: .originPrice)
                    title = try values.decodeIfPresent(String.self, forKey: .title)
                    descript = try values.decodeIfPresent(String.self, forKey: .descript)
                }

            }

            public struct List2: Decodable, HomeBannerListProtocol {
                public let image: String?
                public let dcRate: String?
                public let price: String?
                public let link: String?
                public let badgeNm: String?
                public let place: String?
                public let originPrice: String?
                public let title: String?
                public let descript: String?

                enum CodingKeys: String, CodingKey {

                    case image = "image"
                    case dcRate = "dcRate"
                    case price = "price"
                    case link = "link"
                    case badgeNm = "badgeNm"
                    case place = "place"
                    case originPrice = "originPrice"
                    case title = "title"
                    case descript = "descript"
                }

                public init(from decoder: Decoder) throws {
                    let values = try decoder.container(keyedBy: CodingKeys.self)
                    image = try values.decodeIfPresent(String.self, forKey: .image)
                    dcRate = try values.decodeIfPresent(String.self, forKey: .dcRate)
                    price = try values.decodeIfPresent(String.self, forKey: .price)
                    link = try values.decodeIfPresent(String.self, forKey: .link)
                    badgeNm = try values.decodeIfPresent(String.self, forKey: .badgeNm)
                    place = try values.decodeIfPresent(String.self, forKey: .place)
                    originPrice = try values.decodeIfPresent(String.self, forKey: .originPrice)
                    title = try values.decodeIfPresent(String.self, forKey: .title)
                    descript = try values.decodeIfPresent(String.self, forKey: .descript)
                }

            }

        }
    }
}
