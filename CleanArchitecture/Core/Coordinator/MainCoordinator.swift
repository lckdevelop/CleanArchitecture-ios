//
//  MainCoordinator.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import SwiftUI

enum Page: String, Identifiable {
    case food, trend, notice
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case stcd
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case trend
    
    var id: String {
        self.rawValue
    }
}

class MainCoordinator: ObservableObject {
    @Published var path: [Page] = []  // NavigationStack 관리
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?

    // MARK: 화면 전환 방식 정의
    func push(page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
}
