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
        .navigationTitle("쿠폰")
    }
}
