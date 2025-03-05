//
//  ToastView.swift
//  CleanArchitecture
//
//  Created by 김서진 on 3/6/25.
//

import Foundation
import SwiftUI

struct ToastView: View {
    let message: String
    var backgroundColor: Color = Color.black.opacity(0.7)
    var textColor: Color = .white
    var duration: Double = 3.0
    var bottomPadding: CGFloat = 20
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text(message)
                .padding()
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(10)
                .padding(.bottom, bottomPadding)
        }
        .transition(.move(edge: .bottom))
        .animation(.easeInOut, value: isPresented)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                isPresented = false
            }
        }
    }
}

extension View {
    func toast(message: String, isPresented: Binding<Bool>, duration: Double = 3.0) -> some View {
        ZStack {
            self
            
            if isPresented.wrappedValue {
                ToastView(
                    message: message,
                    duration: duration,
                    isPresented: isPresented
                )
            }
        }
    }
}

#Preview {
    struct ToastPreview: View {
        @State private var showToast = true
        @State private var message = "쿠폰이 다운로드 되었습니다."
        
        var body: some View {
            ZStack {
                VStack {
                    Button("토스트 표시") {
                        message = "쿠폰이 다운로드 되었습니다."
                        showToast = true
                    }
                    
                    Button("에러 토스트") {
                        message = "네트워크 오류가 발생했습니다."
                        showToast = true
                    }
                }
                
                if showToast {
                    ToastView(message: message, isPresented: $showToast)
                }
            }
        }
    }
    
    return ToastPreview()
}
