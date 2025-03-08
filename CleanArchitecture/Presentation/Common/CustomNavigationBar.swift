//
//  CustomNavigationBar.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/8/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode> // 뒤로 가기 기능
    @Environment(\.dismiss) var dismiss // dismiss를 사용해서 네비게이션 스택을 리셋
    @StateObject var homeViewModel = ViewControllerFactory.shared.makeHomeViewModel()

    var title: String

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
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
                    dismiss() // 현재 스택을 리셋
                }) {
                    Image(systemName: "house")
                        .foregroundColor(.blue)
                        .font(.system(size: 23))
                }
            }
            .frame(height: 10)
            .padding(.horizontal, 15)
            //.padding(.bottom, 40) <- 이거 하면 백버튼 왜 안되냐아
            .background(Color.white)
        }
        .frame(height: 10)
    }
}
