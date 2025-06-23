//
//  ToastView.swift
//  DesignKit
//
//  Created by 김서진 on 3/6/25.
//

import Foundation
import SwiftUI

public extension View {
    func toast(message: String, isPresented: Binding<Bool>) -> some View {
        self.modifier(ToastModifier(message: message, isPresented: isPresented))
    }
}

public struct ToastModifier: ViewModifier {
    let message: String
    @Binding var isPresented: Bool
    
    public init(message: String, isPresented: Binding<Bool>) {
        self.message = message
        self._isPresented = isPresented
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                VStack {
                    Spacer()
                    Text(message)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(8)
                        .padding(.bottom, 20)
                }
            }
        }
    }
}
