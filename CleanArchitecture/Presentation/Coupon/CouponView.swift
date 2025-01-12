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
            LazyVGrid(columns: columns) {
                ForEach(colors, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 100)
                        .foregroundColor(color)
                }
            }
        }
        .padding()
    }
}

#Preview {
    
}
