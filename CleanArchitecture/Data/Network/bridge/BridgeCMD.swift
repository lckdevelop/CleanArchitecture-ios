//
//  BridgeCMD.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/9/25.
//

import Foundation

enum BridgeCMD: String {
    case NON_CMD = ""
    case CLOSE = "CLOSE"
    case BACK = "BACK"
    case CLOSE_ALL = "CLOSE_ALL"
    case MOVE_NATIVE = "MOVE_NATIVE"
    case OPEN_WEBVIEW = "OPEN_WEBVIEW"
    
}

enum NativeScreenName: String {
    case home = "Home"
    case cultureCenter = "CultureCenter"
    case coupon = "Coupon"
    case NativePushScreen = "NativePushScreen"
    case NativePresentScreen = "NativePresentScreen"
    
}
