//
//  MainTabViewController.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import SwiftUI

struct MainTabViewController: View {
    @State public var selectedTab: MainTabType = .cultureCenter
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            ForEach(MainTabType.allCases, id: \.self) { tab in
                Group {
                    switch tab {
                    case .cultureCenter:
                        // UIKit으로 구현된 ViewController 때문에 UIViewControllerRepresentable 로 wrapping 하여 넣어줌. ViewControllerFactory 사용하여 VC 생성
                        LectureResultViewWrapper()
                    case .coupon:
                        Text("쿠폰 collection view")
                        //ChatListView(viewModel: .init(container: container, userId: authViewModel.userId ?? ""))
                    }
                }
                .tabItem {
                    Label(tab.title, systemImage: tab.imageName(selected: selectedTab == tab))
                }
                .tag(tab)
            }
        }

    }
}

#Preview {
    MainTabViewController()
}
