//
//  SearchBarView.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/17/25.
//

import SwiftUI

struct SearchBarView: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    SearchBarView()
}
