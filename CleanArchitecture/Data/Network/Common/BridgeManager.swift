//
//  BridgeManager.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/9/25.
//

import Foundation
import Combine

class BridgeManager: NSObject {
    static let shared = BridgeManager()
    private var cancellables = Set<AnyCancellable>()

    var webView: BaseWebView!
    
    func setWebView(_ webView: BaseWebView) {
        self.webView = webView
    }
    
    func checkBridgeMessage(cmd: BridgeCMD, params: [String: Any], callback: String) {
        var data = params
        print("bridge: code: [ \(cmd) ] , params: \(params), callback: \(callback)")
        
        switch cmd {
            case .NON_CMD:
                print("")
            case .BACK:
                print("BACK")
            case .CLOSE:
                print("CLOSE")

            case .CLOSE_ALL:
                print("CLOSE_ALL")
        }
    }
    

    
    
    
    
    
}

