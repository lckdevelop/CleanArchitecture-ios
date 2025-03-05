//
//  CouponDetailView.swift
//  CleanArchitecture
//
//  Created by 김서진 on 2/22/25.
//

import SwiftUI
import Kingfisher

struct CouponDetailView: View {
    let coupon: Coupon
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            VStack {
                // 닫기 버튼
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding()
                    }
                }
                
                //쿠폰 타이틀
                Text(coupon.name ?? "")

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
    
    let coupon = Coupon(campId: "", ofrId: "", name: "테스트 쿠폰", titleImage: "", copnTypeGbcd: "01")
    CouponDetailView(coupon: coupon)
}
