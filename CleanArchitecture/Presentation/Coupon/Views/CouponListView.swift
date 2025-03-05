//
//  CouponListView.swift
//  CleanArchitecture
//
//  Created by 김서진 on 3/5/25.
//

import SwiftUI

struct CouponListView: View {
    let coupons: [Coupon]
    let onAction: (CouponAction) -> Void

    var body: some View {
        List {
            ForEach(coupons, id: \.name) { coupon in
                CouponRowView(coupon: coupon, onAction: onAction)
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))

            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    let coupons = [
        Coupon(campId: "", ofrId: "", name: "타파스와 핀초스", titleImage: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788970417981.jpg", copnTypeGbcd: "01"),
        Coupon(campId: "", ofrId: "", name: "타파스와 핀초스", titleImage: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788970417981.jpg", copnTypeGbcd: "01")
    ]
    CouponListView(coupons: coupons, onAction: { action in
        print(action)
    })
}

