//
//  CouponView.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import SwiftUI

struct CouponView: View {
    @StateObject var viewModel: CouponViewModel
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let colors: [Color] = [.black, .blue, .brown, .cyan, .gray, .indigo, .mint, .yellow, .orange, .purple]
    
    var body: some View {
        ScrollView {
            List {
                ForEach(viewModel.coupons, id: \.self) { coupon in
                    Text("\(coupon.name)")
                }
            }
        }
        .onAppear {
            viewModel.loadCouponList()
        }
        .padding()
    }
}

#Preview {
    let couponRepository = CouponRepository(networkManager: .shared)
    let couponService = CouponService(repository: couponRepository)
    CouponView(viewModel: CouponViewModel(couponService: couponService))
}
