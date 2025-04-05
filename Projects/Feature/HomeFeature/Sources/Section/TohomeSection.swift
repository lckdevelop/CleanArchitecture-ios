//
//  TohomeSection.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/17/25.
//

import SwiftUI
import Kingfisher
import Domain
import CoreKit
import BaseFeature

public struct TohomeSection: View {
    private var router: RoutingProtocol
    let banners: [HomeBanner]
    
    public init(router: RoutingProtocol, banners: [HomeBanner]) {
        self.router = router
        self.banners = banners
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("현대식품관 투홈")
                    .font(.headline)
                    .bold()
                Spacer()
                Button(action: {
                    router.navigate(.push, route: HomeRoute.webViewExam(WebViewModel(url: LinkUrl.WEB_TO_HOME, method: "S")))
                }) {
                    Text("더보기 >")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(banners, id: \.title) { banner in
                    TohomeCardView(banner: banner)
                        .onTapGesture {
                            router.navigate(.push, route: HomeRoute.foodDetail(banner))
                        }
                }
            }
        }
    }
}
