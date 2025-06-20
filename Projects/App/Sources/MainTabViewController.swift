//
//  MainTabViewController.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import SwiftUI
import CoreKit
import Domain
import HomeFeature
import CouponFeature
import CultureCenterFeature
import Domain
import RootFeature
import Shared

public struct MainTabViewController: View {
    public init() {}
    static var shared: MainTabViewController?
    
    @EnvironmentObject private var router: AppRouter
    
    @State public var selectedTab: MainTabType = .home
    @ObservedObject var homeViewModel = HomeBuilder.buildViewModel()
    @ObservedObject var couponViewModel = CouponBuilder.buildViewModel()

    public var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(MainTabType.allCases, id: \.self) { tab in
                // 각각의 Tab Destination 정의하여 추후엔 이렇게도 사용 가능하지만 merge 시 충돌 문제로 주석처리.
                // tab.destination
                Group {
                    switch tab {
                    case .home:
                        HomeNavigationStack()
                            .environmentObject(homeViewModel)
                    case .cultureCenter:
                        // UIKit으로 구현된 ViewController 때문에 UIViewControllerRepresentable 로 wrapping 하여 넣어줌. ViewControllerFactory 사용하여 VC 생성
                        LectureResultViewWrapper()
                    case .coupon:
                        CouponNavigationStack()
                            .environmentObject(couponViewModel)
                    case .permission:
                        PermissionScreen()
                    }
                }
                .tabItem {
                    Label(tab.title, systemImage: tab.imageName(selected: selectedTab == tab))
                }
                .tag(tab)
            }
        }.onChange(of: selectedTab) { newValue in
            print("selectedTab: \(newValue)")
            router.selectedTab = newValue
        }
        
    }

    struct HomeNavigationStack: View {
        @EnvironmentObject private var router: AppRouter
        @EnvironmentObject private var homeViewModel: HomeViewModel
        
        var body: some View {
            CustomNavigationContainer(
                navigator: router.homeNavigator,
                content: {
                    HomeScreen(router: router, homeViewModel: homeViewModel)
                },
                destination: { route in
                    switch route {
                    case .homeScreen:
                        HomeScreen(router: router, homeViewModel: homeViewModel)
                    case .shoppingInfoDetail(let homeBanner):
                        BaseWebView(url: homeBanner.link, navTitle: NavigationTitle.WEB_SHOPPING_TITLE, router: router)
                    case .foodDetail(let homeBanner):
                        BaseWebView(url: homeBanner.link, navTitle: NavigationTitle.WEB_TOHOME_TITLE, router: router)
                    case .webViewExam(let webviewModel):
                        BaseWebView(url: webviewModel.url ?? "", navTitle: "Bridge Test", router: router)
                    case .NativePushScreen:
                        NativePushScreen()
                    case .NativePresentScreen:
                        NativePresentScreen()
                    }
                    
                }
                
            )
        }
    }
    
    struct CouponNavigationStack: View {
        @EnvironmentObject private var router: AppRouter
        @EnvironmentObject private var couponViewModel: CouponViewModel
        
        var body: some View {
            CustomNavigationContainer(
                navigator: router.couponNavigator,
                content: {
                    CouponScreen(router: router, couponViewModel: couponViewModel)
                },
                destination: { route in
                    switch route {
                    case .couponScreen:
                        CouponScreen(router: router, couponViewModel: couponViewModel)
                    case .couponDetail(let coupon):
                        CouponDetailView(coupon: coupon, router: router)
                    }
                }
                
            )
        }
        
        // iOS 16 이상에서 사용 가능한 NavigationStack 사용시 이렇게
        // NavigationStack(path: $router.couponNavigator.routes) {
        //     CouponScreen(couponViewModel: couponViewModel)
        //         .navigationDestination(for: CouponRoute.self) { route in
        //             switch route {
        //             case .couponDetail(let coupon):
        //                 CouponDetailView(coupon: coupon)
        //             }
        //         }
        // }
        
    }
    
    struct CultureLectureNavigationStack: View {
        @EnvironmentObject private var router: AppRouter
        var body: some View {
            // UIKit으로 구현된 ViewController 때문에 UIViewControllerRepresentable 로 wrapping 하여 넣어줌. ViewControllerFactory 사용하여 VC 생성
            LectureResultViewWrapper()
        }
    }
    
    
}
