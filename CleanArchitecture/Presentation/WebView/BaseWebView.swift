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
    @Binding var hideTabBar: Bool

    let url: URL
    let navTitle: String
    
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

struct WebView: UIViewRepresentable {
    let url: URL
    let CONFIG_WEB_NAME = "callAppNative"
    

    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero, configuration: makeConfiguration())
        
        webView.configuration.userContentController.add(ContentController(), name: CONFIG_WEB_NAME)

        
        return webView
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

class ContentController: NSObject, WKScriptMessageHandler {
    var cmd: String = ""
    var param: [String: String] = [String: String]()
    var paramAnyObject: [String: Any] = [String: Any]()
    var paramString: String?
    var callback: String = ""
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("message name : \(message.name)")
        
        if message.name == "callAppNative", let body = message.body as? [String: Any] {
            if let cmd = body["CMD"] as? String {
                self.cmd = cmd
            }
            
            if let param = body["PARAMS"] {
                if let dictionary = param as? Dictionary<String, String> {
                    self.param = dictionary
                } else if let paramString = param as? String {
                    self.paramString = paramString
                } else if let paramAnyObject = param as? Dictionary<String, Any> {
                    self.paramAnyObject = paramAnyObject
                }
            }
                
            if let callback = body["CALLBACK"] as? String {
                self.callback = callback
            }
            
            BridgeManager.shared.checkBridgeMessage(cmd: BridgeCMD(rawValue: cmd) ?? .NON_CMD, params: param, callback: callback)
            
        }
    }
}

#Preview {
    // preview에서는 binding값을 전달 받을 수 없으므로 가상의 binding 값 생성
    //BaseWebView(url: URL(string: "https://www.naver.com")!, navTitle: <#Binding<String>#>)
}
