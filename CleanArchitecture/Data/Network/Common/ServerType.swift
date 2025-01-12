//
//  ServerType.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

enum ServerType {
    case dev //개발서버
    case stg //스테이징서버
    case release //운영서버

    var urlEHyundai: String {
        switch self {
        case .dev:
            return "http://dev.ehyundai.com:18011"
        case .stg:
            return "https://www.ehyundai.com"
        case .release:
            return "https://www.ehyundai.com"
        }
    }
    
    var urlEHyundaiApp: String {
        switch self {
        case .dev:
            return "https://hdeappdev.ehyundai.com:18911"//"http://10.100.166.54:18910"
        case .stg:
            return "https://hdeappstg.ehyundai.com"
        case .release:
            return "https://hdeapp.ehyundai.com"
        }
    }
    
    var urlCard: String {
        switch self {
        case .dev:
            return "http://hdcappdev.ehyundai.com:15181"//"http://10.100.166.42:15181"
        case .stg:
            return "https://hdcapp.ehyundai.com"
        case .release:
            return "https://hdcapp.ehyundai.com"
        }
    }
    
    var urlU2L: String {
        switch self {
        case .dev:
            return "https://dev-u2l.ehyundai.com:18011"
        case .stg:
            return "https://www.ehyundai.com"
        case .release:
            return "https://www.ehyundai.com"
        }
    }
    
    var urlFido: String {
        switch self {
        case .dev:
            return "https://biodev.signgate.com"
        case .stg:
            return "https://bio.signgate.com"
        case .release:
            return "https://bio.signgate.com"
        }
    }
    
    var urlChatBot: String {
        switch self {
        case .dev:
            return "https://devchat.ehyundai.com:17443"
        case .stg:
            return "https://chat.ehyundai.com"
        case .release:
            return "https://chat.ehyundai.com"
        }
    }
    
    var urlEHyundaiChatbot: String {
        switch self {
        case .dev:
            return "https://dev-u2l.ehyundai.com:18011/newPortal/KakaoChatbot/selectAppCustInf.do"
        case .stg:
            return "https://www.ehyundai.com/newPortal/KakaoChatbot/selectAppCustInf.do"
        case .release:
            return "https://www.ehyundai.com/newPortal/KakaoChatbot/selectAppCustInf.do"
        }
    }
    
    var urlImageServer: String {
        switch self {
        case .dev:
            return "http://imgdev.ehyundai.com:18930"
        case .stg:
            return "https://img.ehyundai.com"
        case .release:
            return "https://img.ehyundai.com"
        }
    }
    
    var urlImageOriginServer: String {
        switch self {
        case .dev:
            return "http://imgdev.ehyundai.com:18930"
        case .stg:
            return "http://211.109.95.227"
        case .release:
            return "http://211.109.95.227"
        }
    }
    
    var cookieDomain: String {
        switch self {
        case .dev:
            return "hdeappdev.ehyundai.com"
        case .stg:
            return "hdeappstg.ehyundai.com"
        case .release:
            return "hdeapp.ehyundai.com"
        }
//        return ".ehyundai.com"
    }
    
    var cookieU2LDomain: String {
        switch self {
        case .dev:
            return "dev-u2l.ehyundai.com"
        case .stg:
            return "www.ehyundai.com"
        case .release:
            return "www.ehyundai.com"
        }
//        return ".ehyundai.com"
    }
    
    var beaconUrl: String {
        switch self {
        case .dev:
            return "https://dev-hbeacon.h-point.co.kr:29875/airbeacon_apiSdk/sv2/"
        case .stg:
            return "https://hbeacon.h-point.co.kr/airbeacon_apiSdk/sv2/"
        case .release:
            return "https://hbeacon.h-point.co.kr/airbeacon_apiSdk/sv2/"
        }
    }
    
    var webJasminDomain: String {
        switch self {
        case .dev:
            return "http://10.100.166.39:19620"
        case .stg:
            return "http://jasmin.ehyundai.com"//jasmin.ehyundai.com"
        case .release:
            return "http://jasmin.ehyundai.com"//"https://jasmin.ehyundai.com"
        }
    }
    
    var authWebDomain: String {
        switch self {
        case .dev:
            return "dev.ehyundai.com"
        case .stg:
            return "www.ehyundai.com"
        case .release:
            return "www.ehyundai.com"
        }
    }
    
    var authWebViewPort: String {
        switch self {
        case .dev:
            return ":18011"
        case .stg:
            return ":18011"
        case .release:
            return ":18011"
        }
    }
    
    var receiptDomain: String {
        switch self {
        case .dev:
            return "https://apidev.h-point.co.kr:29855"
        case .stg:
            return "https://api.h-point.co.kr:29855"
        case .release:
            return "https://api.h-point.co.kr:29855"
        }
    }
    
    var urlEHyundaiAppPoint: String {
        switch self {
        case .dev:
            return "http://hdeappdev.ehyundai.com:18910"
        case .stg:
            return "https://hdeapp.ehyundai.com"
        case .release:
            return "https://hdeapp.ehyundai.com"
        }
    }
    
    var urlOcrServer: String {
        switch self {
        case .dev:
            return "https://ocrdev.ehyundai.com:15142"
        case .stg:
            return "https://ocr.ehyundai.com"
        case .release:
            return "https://ocr.ehyundai.com"
        }
    }
    
    var urlAppIron: String {
        switch self {
        case .dev:
            return "https://appirondev.ehyundai.com:15281"
        case .stg:
            return "https://appiron.ehyundai.com"
        case .release:
            return "https://appiron.ehyundai.com"
        }
    }
    
    var urlU2LImg: String {
        switch self {
        case .dev:
            return "http://dev-u2l.ehyundai.com"
        case .stg:
            return "https://www.ehyundai.com"
        case .release:
            return "https://www.ehyundai.com"
        }
    }
    // 문화센터 결제
    var paymentForCulture: String {
        switch self {
        case .dev:
            return "https://dev.ehyundai.com:18011"
        case .stg:
            return "https://www.ehyundai.com"
        case .release:
            return "https://www.ehyundai.com"
        }
    }
    
    // hpoint hostURL
    var urlHpoint: String {
        switch self {
        case .release:
            return "https://m.h-point.co.kr:29845"
        case .stg:
            return "https://m-stg.h-point.co.kr"
        case .dev:
            return "https://mdev.h-point.co.kr:29845"
        }
    }
}

