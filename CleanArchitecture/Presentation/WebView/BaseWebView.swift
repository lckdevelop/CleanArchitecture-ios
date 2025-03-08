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
        let webView = WKWebView(frame: .zero, configuration: makeConfiguration())

        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    private func makeConfiguration() -> WKWebViewConfiguration {
        let configuration = WKWebViewConfiguration()
        configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
        return configuration
    }
}

// WebView를 감싸는 화면
struct BaseWebView: View {
    @Binding var hideTabBar: Bool
    
    var url: URL
    var navTitle: String

    
    var body: some View {
        VStack {
            CustomNavigationBar(title: navTitle)
            WebView(url: url)
                .navigationBarHidden(true)  // 네비게이션 바 숨기기
                .edgesIgnoringSafeArea(.all)
                .toolbar(hideTabBar ? .hidden : .automatic, for: .tabBar) // 16이상 부터 지원(안그럼 커스텀 해야 됨)
        }.onAppear {
            hideTabBar = true // 화면에 나타날 때 TabBar 숨기기
        }
        .onDisappear {
            hideTabBar = false // 화면에서 사라질 때 TabBar 보이기
        }
    }
}


#Preview {
    // preview에서는 binding값을 전달 받을 수 없으므로 가상의 binding 값 생성
    //BaseWebView(url: URL(string: "https://www.naver.com")!, navTitle: <#Binding<String>#>)
}
