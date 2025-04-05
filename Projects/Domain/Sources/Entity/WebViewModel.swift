//
//  WebViewModel.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/16/25.
//

import Foundation

public struct WebViewModel: Hashable, Equatable {
    public init(url: String?, method: String?) {
        self.url = url
        self.method = method
    }
    
    public let url: String?
    let method: String?
}

