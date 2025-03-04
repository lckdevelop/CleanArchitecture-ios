//
//  BaseWebView.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

// WebView를 감싸는 화면
struct BaseWebView: View {
    let url: URL

    var body: some View {
        WebView(url: url)
            .navigationBarHidden(false)  // 네비게이션 바 숨기기
            .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    // preview에서는 binding값을 전달 받을 수 없으므로 가상의 binding 값 생성
    //BaseWebView(url: <#URL#>)
}
