//
//  MainTabViewController.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import SwiftUI
import Data

struct MainTabViewController: View {
    @State var selectedTab: MainTabType = .cultureCenter
    @StateObject var couponViewModel: CouponViewModel
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            ForEach(MainTabType.allCases, id: \.self) { tab in
                Group {
                    switch tab {
                    case .cultureCenter:
                        // UIKit으로 구현된 ViewController 때문에 UIViewControllerRepresentable 로 wrapping 하여 넣어줌. ViewControllerFactory 사용하여 VC 생성
                        LectureResultViewWrapper()
                    case .coupon:
                        CouponView(viewModel: couponViewModel)
                       
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
    let couponRepository = CouponRepository(networkManager: .shared)
    let couponService = CouponService(repository: couponRepository)
    let couponViewModel = CouponViewModel(couponService: couponService)
    
    MainTabViewController(couponViewModel: couponViewModel)
}
