//
//  CouponView.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import SwiftUI
import Kingfisher
import BaseFeature
import CoreKit
import DesignKit

public struct CouponScreen: View {
    private var router: RoutingProtocol
    @ObservedObject var couponViewModel: CouponViewModel
    
    public init(router: RoutingProtocol, couponViewModel: CouponViewModel) {
        self.router = router
        self.couponViewModel = couponViewModel
    }
    
    public var body: some View {
        ZStack {
            CouponListView(
                coupons: couponViewModel.couponList ?? [],
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
