//
//  MainTabViewController.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import SwiftUI

struct MainTabViewController: View {

    @EnvironmentObject private var router: AppRouter
    @EnvironmentObject private var couponStore: CouponStore
    
    var body: some View {
        
        TabView(selection: $router.selectedTab) {
            
            ForEach(MainTabType.allCases, id: \.self) { tab in
                Group {
                    switch tab {
                    case .cultureCenter:
                        CultureLectureNavigationStack()
                    case .coupon:
                        CouponNavigationStack()
                        
                    }
                }
                .tabItem {
                    Label(tab.title, systemImage: tab.imageName(selected: router.selectedTab == tab))
                }
                .tag(tab)
            }
        }
        
        
        
    }
}

struct CouponNavigationStack: View {
    @EnvironmentObject private var router: AppRouter
    @EnvironmentObject private var couponStore: CouponStore
    
    var body: some View {
        NavigationStack(path: $router.couponNavigator.routes) {
            CouponScreen(store: couponStore)
            .onAppear {
                    print("CouponScreen appeared")
                    print("Current routes: \(router.couponNavigator.routes)")
                    print("CouponStore state: \(couponStore)")
                }
                .navigationDestination(for: CouponRoute.self) { route in
                    switch route {
                    case .couponDetail(let coupon):
                        CouponDetailView(coupon: coupon)
                    }
                }
        }
    }
}

struct CultureLectureNavigationStack: View {
    @EnvironmentObject private var router: AppRouter
    var body: some View {
        // UIKit으로 구현된 ViewController 때문에 UIViewControllerRepresentable 로 wrapping 하여 넣어줌. ViewControllerFactory 사용하여 VC 생성
        LectureResultViewWrapper()
    }
}

#Preview {
    // DIContainer 사용 이전
    //    let couponRepository = CouponRepository(networkManager: .shared)
    //    let couponService = CouponService(repository: couponRepository)
    //    let couponViewModel = CouponViewModel(couponService: couponService)
    
    // DIContainer(Swinject) 사용시 이렇게
    // let couponViewModel = DIContainer.shared.resolve(CouponViewModel.self)
    // MainTabViewController(couponViewModel: couponViewModel!)
    
    let couponStore = DIContainer.shared.resolve(CouponStore.self)
    let router = AppRouter()

    MainTabViewController()
        .environmentObject(couponStore!)
        .environmentObject(router)
}
