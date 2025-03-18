//
//  HomeScreen.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import SwiftUI
import Combine
import Kingfisher

struct HomeScreen: View {
    @EnvironmentObject private var router: AppRouter
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var isSheetPresented = false // Sheet 표시 여부

    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    SearchBarView() // 검색바
                    
                    ShoppingInfoSection(banners: homeViewModel.trendBannerList ?? []) // 쇼핑인포
                    
                    TohomeSection(banners: homeViewModel.foodBannerList ?? []) // 투홈
                }
                .padding()
                .onAppear {
                    self.homeViewModel.fetchHomeBanner()
                }
                .onDisappear {
                    homeViewModel.cancelSubscriptions()
                }
            .navigationBarHidden(true) // 네비게이션 바 숨김 처리
            // present 방식으로 올때
            .sheet(isPresented: $router.isPresenting, onDismiss: {
                // Sheet가 닫힐 때 상태를 초기화하거나 처리할 작업을 넣을 수 있음
            }) {
                if let view = router.presentedRouteView {
                    view
                }
            }
        }
    }
}

#Preview {
    //HomeView(homeViewModel: ViewControllerFactory.shared.makeHomeViewModel())
}
