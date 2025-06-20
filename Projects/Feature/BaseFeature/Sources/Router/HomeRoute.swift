//
//  HomeRoute.swift
//  CleanArchitecture
//
//  Created by 김서진 on 3/8/25.
//

import Foundation
import Domain
import CoreKit

public enum HomeRoute: NavigationRoute {
    case homeScreen
    case shoppingInfoDetail(HomeBanner)
    case foodDetail(HomeBanner)
    case webViewExam(WebViewModel)
    case NativePushScreen
    case NativePresentScreen
}
