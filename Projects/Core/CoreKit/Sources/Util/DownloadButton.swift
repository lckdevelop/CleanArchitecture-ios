//
//  DownloadButton.swift
//  CleanArchitecture
//
//  Created by 김서진 on 3/5/25.
//

import Foundation
import SwiftUI

public struct DownloadButton: View {
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var action: () -> Void
    
    public var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: "arrow.down.circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.indigo)
        }
        .buttonStyle(PlainButtonStyle())
        .contentShape(Rectangle())
    }
}
