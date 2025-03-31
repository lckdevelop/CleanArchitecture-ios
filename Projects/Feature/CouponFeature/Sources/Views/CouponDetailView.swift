//
//  CouponDetailView.swift
//  CleanArchitecture
//
//  Created by 김서진 on 2/22/25.
//

import SwiftUI
import Kingfisher
import Domain

struct CouponDetailView: View {
    let coupon: CouponEntity
    
    @EnvironmentObject private var router: AppRouter
    var body: some View {
        ScrollView {
            VStack {
                // 닫기 버튼
                HStack {
                    Spacer()
                    Button(action: {
                        router.navigate(.pop)
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding()
                    }
                }
                
                //쿠폰 타이틀
                Text(coupon.name)

                //쿠폰 이미지
                if let url = URL(string: coupon.titleImage ?? "") {
                    KFImage(url)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFill() // 이미지가 원 안에 꽉 차도록 설정
                        .clipShape(Circle()) // 원형으로 클립
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
                Button(action: {}) {
                Text("쿠폰 받기")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.indigo)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .background(Color.white)
        }
        .onDisappear {
            
        }
    }
}

#Preview {
    let coupon = CouponEntity(
        id: "test-id",
        campId: "",
        ofrId: "",
        name: "테스트 쿠폰",
        titleImage: "https://image.h-point.co.kr//images_share/cp/cp0001/2025/0224/1815/20250224181554944.jpg",
        couponType: .coupon
    )
    
    return CouponDetailView(coupon: coupon)
        .environmentObject(AppRouter())
}
