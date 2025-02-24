//
//  CouponView.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import SwiftUI
import Kingfisher

struct CouponView: View {
    @StateObject var viewModel: CouponViewModel
    
    var body: some View {
        
        List {
            ForEach(viewModel.couponList?.coupons ?? [], id: \.name) { coupon in
                HStack {
                    if let url = URL(string: coupon.titleImage ?? "") {
                        KFImage(url)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFill() // 이미지가 원 안에 꽉 차도록 설정
                            .clipShape(Circle()) // 원형으로 클립
                            
                        Spacer()
                        
                        Text("\(String(describing: coupon.name ?? ""))")
                    }

                }
                
            }
            
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.loadCouponList()
        }
        .padding()
    }
}

#Preview {
    // DIContainer 사용 이전
//    let couponRepository = CouponRepository(networkManager: .shared)
//    let couponService = CouponService(repository: couponRepository)
//    CouponView(viewModel: CouponViewModel(couponService: couponService))
    
    // DIContainer(Swinject) 사용시 이렇게
    let viewModel = DIContainer.shared.resolve(CouponViewModel.self)
    CouponView(viewModel: viewModel!)
    
}
