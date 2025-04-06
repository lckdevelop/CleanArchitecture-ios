//
//  BaseWebView.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import SwiftUI
import WebKit
import CoreKit

public struct BaseWebView: View {
    private var router: RoutingProtocol
    
    public init(url: String, navTitle: String, router: RoutingProtocol) {
        self.url = url
        self.navTitle = navTitle
        self.router = router
    }
    let url: String
    let navTitle: String
    
    public var body: some View {
        VStack {
            CustomNavigationBar(router: router, title: navTitle)
            if let url = URL(string: url) {
                WebViewWrapper(router: router, url: url)
                    .navigationBarHidden(true)  // 디폴트 네비게이션 바 숨기기
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

