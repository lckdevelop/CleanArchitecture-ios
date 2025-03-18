//
//  ShoppingCardView.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/17/25.
//

import SwiftUI
import Kingfisher

struct ShoppingCardView: View {
    let banner: HomeBanner

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            KFImage(URL(string: banner.image))
                .resizable()
                .scaledToFill()
                .frame(height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(banner.badgeNm)
                .font(.caption)
                .foregroundColor(.gray)
            Text(banner.title)
                .font(.headline)
                .foregroundColor(.black)
        }
    }
}
