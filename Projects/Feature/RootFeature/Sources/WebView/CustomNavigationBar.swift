//
//  CustomNavigationBar.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/8/25.
//

import SwiftUI
import CoreKit

public struct CustomNavigationBar: View {
    public init(router: RoutingProtocol, title: String) {
        self.router = router
        self.title = title
    }
    
    private var router: RoutingProtocol

    var title: String

    public var body: some View {
        VStack {
            HStack {
                Button(action: {
                    router.navigate(.pop, route: router)
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
                    router.navigate(.popToRoot, route: router)
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
