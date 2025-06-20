//
//  WebViewContentController.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/17/25.
//

import WebKit
import CoreKit

class WebViewContentController: NSObject, WKScriptMessageHandler {
    var cmd: String = ""
    var param: [String: String] = [:]
    var paramAnyObject: [String: Any] = [:]
    var paramString: String?
    var callback: String = ""
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("message name : \(message.name)")
        
        guard message.name == "callAppNative", let body = message.body as? [String: Any] else {
            return
        }
        
        if let cmd = body["CMD"] as? String {
            self.cmd = cmd
        }
        
        if let param = body["PARAMS"] {
            if let dictionary = param as? [String: String] {
                self.param = dictionary
            } else if let paramString = param as? String {
                self.paramString = paramString
            } else if let paramAnyObject = param as? [String: Any] {
                self.paramAnyObject = paramAnyObject
            }
        }
        
        if let callback = body["CALLBACK"] as? String {
            self.callback = callback
        }
        
        BridgeManager.shared.checkBridgeMessage(
            cmd: BridgeCMD(rawValue: cmd) ?? .NON_CMD,
            params: param,
            callback: callback
        )
    }
}
