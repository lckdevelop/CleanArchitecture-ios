//
//  BaseWebView.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import SwiftUI
import WebKit

// WebView를 감싸는 화면
struct BaseWebView: View {
    let url: String
    let navTitle: String
    
    var body: some View {
        VStack {
            CustomNavigationBar(title: navTitle)
            if let url = URL(string: url) {
                WebViewWrapper(url: url)
                    .navigationBarHidden(true)  // 디폴트 네비게이션 바 숨기기
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

