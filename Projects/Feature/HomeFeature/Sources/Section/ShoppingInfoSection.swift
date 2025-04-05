//
//  ShoppingInfoSection.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/17/25.
//

import SwiftUI
import Kingfisher
import Domain
import CoreKit
import BaseFeature

public struct ShoppingInfoSection: View {
    public init(router: RoutingProtocol, banners: [HomeBanner]) {
        self.router = router
        self.banners = banners
    }
    
    private var router: RoutingProtocol
    let banners: [HomeBanner]

    public var body: some View {
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
