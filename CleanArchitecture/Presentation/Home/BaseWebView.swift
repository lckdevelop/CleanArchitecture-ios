//
//  BaseWebView.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import SwiftUI
import WebKit

//struct BaseWebView: UIViewRepresentable {
//    //@Binding var test: String
//    
//    var body: some View {
//        VStack {
//            
//        }
//    }
//    
//    var url: URL?
//    var webView: WKWebView
//    
//    init(url: URL? = nil) {
//        self.url = url
//        self.webView = WKWebView()
//    }
//    
//    func makeUIView(context: Context) -> WKWebView {
//        
//        guard let url = url else {
//            return webView
//        }
//        
//        webView.load(URLRequest(url: url))
//        return webView
//    }
//    
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        return
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        BaseWebView(url: URL(string: "https://www.apple.com")!)
//            .edgesIgnoringSafeArea(.all)
//    }
//}


struct BaseWebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(URLRequest(url: url))
    }
}

#Preview {
    // preview에서는 binding값을 전달 받을 수 없으므로 가상의 binding 값 생성
    //BaseWebView(test: Binding.constant("preview"))
}
