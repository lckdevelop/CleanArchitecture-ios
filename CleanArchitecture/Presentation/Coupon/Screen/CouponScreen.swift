//
//  CouponView.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import SwiftUI
import Kingfisher

struct CouponScreen: View {
    @EnvironmentObject private var router: AppRouter
    @ObservedObject var couponViewModel: CouponViewModel
    
    var body: some View {
        ZStack {
            CouponListView(
                coupons: couponViewModel.couponList?.coupons ?? [],
                onAction: { action in
                    switch action {
                    case .select(let coupon):
                        router.navigate(.push, route: CouponRoute.couponDetail(coupon))
                    default:
                        couponViewModel.handleAction(action)
                    }
                }
            )
            .onAppear {
                couponViewModel.loadCouponList()
            }
            .toast(message: couponViewModel.toastMessage ?? "", isPresented: $couponViewModel.showToast)
        }
    }
}

#Preview {
    
    let couponRepository = CouponRepository(networkManager: .shared)
    let couponService = CouponUsecase(repository: couponRepository)
    let couponViewModel = CouponViewModel(couponService: couponService)
    
    let router = AppRouter()
    
    // PreviewWrapper 사용
    return PreviewNavigationWrapper(router: router) {
        CouponScreen(couponViewModel: couponViewModel)
            .environmentObject(router)
        
    }

}


// Preview용 래퍼 구조체
struct PreviewNavigationWrapper<Content: View>: View {
    @ObservedObject var router: AppRouter
    let content: Content
    
    init(router: AppRouter, @ViewBuilder content: () -> Content) {
        self.router = router
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.couponNavigator.routes) {
            content
                .navigationDestination(for: CouponRoute.self) { route in
                    switch route {
                    case .couponDetail(let coupon):
                        Text("쿠폰 상세: \(coupon.name ?? "")")
                    }
                }
        }
    }
}
