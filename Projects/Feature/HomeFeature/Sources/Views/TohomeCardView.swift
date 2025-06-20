//
//  TohomeCardView.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/17/25.
//

import SwiftUI
import Kingfisher
import Domain

struct TohomeCardView: View {
    let banner: HomeBanner

    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: banner.image))
                .resizable()
                .scaledToFill()
                .frame(height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("Tohome")
                .font(.caption)
                .foregroundColor(.gray)
            Text(banner.title)
                .font(.headline)
                .foregroundColor(.black)
            Text(banner.price.numberWithCommaFormat)
                .font(.subheadline)
                .bold()
                .foregroundColor(.black)
        }
    }
}
