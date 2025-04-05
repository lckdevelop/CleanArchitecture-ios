//
//  ServerEnvironment.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

enum ServerEnvironment {
    case ehyundaiURL // e현대 포털 API
    case ehyundaiAppURL // e현대 앱 API
    case hpointURL // hpoint API

    var baseURLString: String {
        switch self {
        case .ehyundaiURL:
            return "EHYUNDAI_BASE_URL"
        case .ehyundaiAppURL:
            return "EHYUNDAI_APP_BASE_URL"
        case .hpointURL:
            return "HPOINT_BASE_URL"
        }
    }
    
    // MARK: - Plist baseURL values
    var baseURL: URL {
        guard let baseURLstring = ServerEnvironment.infoDictionary[baseURLString] as? String else {
            fatalError("baseURL not set in plist for this environment")
        }
        guard let url = URL(string: baseURLstring) else {
            fatalError("baseURL is invalid")
        }
        
       return url
    }
    
    var baseURLStr: String {
        guard let baseURLstring = ServerEnvironment.infoDictionary[baseURLString] as? String else {
            fatalError("baseURL not set in plist for this environment")
        }

       return baseURLstring
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
}

