//
//  ShoppingInfoSection.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/17/25.
//

import SwiftUI
import Kingfisher

struct ShoppingInfoSection: View {
    @EnvironmentObject private var router: AppRouter
    let banners: [HomeBanner]

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Shopping Info")
                    .font(.headline)
                    .bold()
                Spacer()
                Button(action: {
                    router.navigate(.push, route: HomeRoute.webViewExam(WebViewModel(url: "http://127.0.0.1:5501/index.html", method: "S")))
                }) {
                    Text("더보기 >")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(banners, id: \.title) { banner in
                        ShoppingCardView(banner: banner)
                            .onTapGesture {
                                router.navigate(.push, route: HomeRoute.shoppingInfoDetail(banner))
                            }
                    }
                }
            }
        }
    }
}
