//
//  CouponRowView.swift
//  CleanArchitecture
//
//  Created by 김서진 on 3/5/25.
//

import SwiftUI
import Kingfisher

struct CouponRowView: View {
    let coupon: CouponEntity
    let onAction: (CouponAction) -> Void

    var body: some View {
        HStack(spacing: 12) {
            if let url = URL(string: coupon.titleImage ?? "") {
                KFImage(url)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFill()
                    .clipShape(Circle())
            }
            
            Spacer()
                
            Text(coupon.name)
            
            DownloadButton {
                onAction(.download(coupon))
            }

            Spacer()
        }
        .padding(.vertical, 8)
        .onTapGesture {
            onAction(.select(coupon))
        }
    }
}

#Preview {
    let coupon = CouponEntity(
        id: "test-id",
        campId: "",
        ofrId: "",
        name: "타파스와 핀초스",
        titleImage: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788970417981.jpg",
        couponType: .coupon
    )
    
    return CouponRowView(coupon: coupon, onAction: { action in
        print(action)
    })
}
