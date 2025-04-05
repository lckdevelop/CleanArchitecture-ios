//
//  CustomNavigationBar.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/8/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    @EnvironmentObject private var router: AppRouter

    var title: String

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    router.navigate(.pop)
                }) {
                    Image(systemName: "lessthan")
                        .foregroundColor(.blue)
                        .font(.system(size: 23))
                }

                Text(title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.leading, 8)
                Spacer()
                Spacer()
                Button(action: {
                    router.navigate(.popToRoot)
                }) {
                    Image(systemName: "house")
                        .foregroundColor(.blue)
                        .font(.system(size: 23))
                }
            }
            .frame(height: 15)
            .padding(.horizontal, 15)
            .background(Color.white)
        }
        .frame(height: 15)
    }
}
