//
//  HomeScreen.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import SwiftUI
import Combine
import Kingfisher
import Domain
import CoreKit

public struct HomeScreen: View {
    public init(router: RoutingProtocol, homeViewModel: HomeViewModel, isSheetPresented: Bool = false) {
        self.router = router
        self.homeViewModel = homeViewModel
        self.isSheetPresented = isSheetPresented
    }
    
    private var router: RoutingProtocol
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var isSheetPresented = false // Sheet 표시 여부

    public var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    SearchBarView() // 검색바
                    
                    ShoppingInfoSection(router: router, banners: homeViewModel.trendBannerList ?? []) // 쇼핑인포
                    
                    TohomeSection(router: router, banners: homeViewModel.foodBannerList ?? []) // 투홈
                }
                .padding()
                .onAppear {
                    homeViewModel.fetchHomeBanner()
                }
                .onDisappear {
                    homeViewModel.cancelSubscriptions()
                }
            .navigationBarHidden(true) // 네비게이션 바 숨김 처리
            // present 방식으로 올때
//            .sheet(isPresented: $router.isPresenting, onDismiss: {
//                // Sheet가 닫힐 때 상태를 초기화하거나 처리할 작업을 넣을 수 있음
//            }) {
//                if let view = router.presentedRouteView {
//                    view
//                }
//            }
        }
    }
}

#Preview {
    //HomeView(homeViewModel: ViewControllerFactory.shared.makeHomeViewModel())
}
