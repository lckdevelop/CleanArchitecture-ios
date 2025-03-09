//
//  HomeView.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import SwiftUI
import Combine
import Kingfisher

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    //@EnvironmentObject private var coordinator: AppCoordinator
    //private var coordinator = WebViewCoordinator(parentCoordinator: DefaultTabCoordinator())
    @State private var hideTabBar:Bool = false // 돌아왔을떄 먼저 그려져 있기 바라는데..
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    SearchBar()
                    //CategoryButtonsView()
                    //CircularCategoryView()
                    
                    // Shopping Info
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Shopping Info")
                                .font(.headline)
                                .bold()
                            Spacer()
                            if let url = URL(string: "http://127.0.0.1:5500/index.html") {
                                NavigationLink(destination: {
                                     BaseWebView(hideTabBar: $hideTabBar, url: url, navTitle: NavigationTitle.WEB_SHOPPING_TITLE)
                                }) {
                                    Text("더보기 >")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }

//                            NavigationLink(destination: coordinator.present(sheet: .stcd)) {
//                                Text("더보기 >")
//                                    .font(.caption)
//                                    .foregroundColor(.gray)
//                            }
//                            NavigationLink(destination: BaseWebView(url: URL(string: "https://hdeapp.ehyundai.com/shopping/view/ASI/A01/001T/evntGdList")!)) {
//                                Text("더보기 >")
//                                    .font(.caption)
//                                    .foregroundColor(.gray)
//                            }
//                            Button("더보기") {
//                                WebViewCoordinator(parentCoordinator: DefaultTabCoordinator(navigationController: UINavigationController())).trendDetail(page: .food)
//                            }
//                            Button(action: {
////                                if let mainCoordinator = self.coordinator?.parentCoordinator {
////                                    WebViewCoordinator(parentCoordinator: mainCoordinator).trendDetail(page: .food)
////                                } else {
////                                    WebViewCoordinator(parentCoordinator: DefaultTabCoordinator(navigationController: UINavigationController())).trendDetail(page: .food)
////                                }
//                                homeViewModel.moreTrendBtnTapped()
//                            }) {
//                                Text("더보기 >")
//                                    .font(.caption)
//                                    .foregroundColor(.gray)
//                            }
                        }
                        .padding(.horizontal)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(homeViewModel.trendBannerList?.prefix(4) ?? [], id: \.title) { banner in
                                    if let url = URL(string: banner.link) {
                                        NavigationLink(destination: BaseWebView(hideTabBar: $hideTabBar, url: url, navTitle: NavigationTitle.WEB_SHOPPING_TITLE)) {
                                        
                                            VStack(alignment: .leading, spacing: 16) {
                                                KFImage(URL(string: banner.image))
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(height: 220)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                Text(banner.badgeNm)
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                                    .foregroundColor(.black)
                                                Text(banner.title)
                                                    .font(.headline)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    // 현대식품관 투홈
                    VStack(alignment: .leading) {
                        HStack {
                            Text("현대식품관 투홈")
                                .font(.headline)
                                .bold()
                            Spacer()
                            if let url = URL(string: LinkUrl.WEB_TO_HOME) {
                                NavigationLink(destination: BaseWebView(hideTabBar: $hideTabBar, url: url, navTitle: NavigationTitle.WEB_TO_HOME_TITLE)) {
                                    Text("더보기 >")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }

//                            Button(action: {
//                                print("현대식품관 투홈 더보기 버튼 클릭")
//                            }) {
//                                Text("더보기 >")
//                                    .font(.caption)
//                                    .foregroundColor(.gray)
//                            }
                        }
                        .padding(.horizontal)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(homeViewModel.foodBannerList?.prefix(6) ?? [], id: \.title) { banner in
                                if let url = URL(string: banner.link) {
                                    NavigationLink(destination: BaseWebView(hideTabBar: $hideTabBar, url: url, navTitle: NavigationTitle.WEB_SHOPPING_TITLE)) {
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
                            }
                        }
                    }
                }
                .padding()
                .onAppear {
                    self.homeViewModel.fetchTohomeBanner()
                }
                .onDisappear {
                    homeViewModel.cancelSubscriptions()
                }
            }
            .navigationBarHidden(true) // 네비게이션 바 숨김 처리
        }
    }
}

struct SearchBar: View {
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

struct CategoryButtonsView: View {
    var body: some View {
        HStack(spacing: 12) {
            CategoryButton(title: "Favorites", icon: "heart")
            CategoryButton(title: "History", icon: "clock")
            CategoryButton(title: "Following", icon: "person.2")
        }
    }
}

struct CategoryButton: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color(.systemGray5))
        .cornerRadius(20)
    }
}

struct BannerView: View {
    var body: some View {
        ZStack {
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .cornerRadius(10)
            
            Text("Banner title")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
        }
    }
}

struct CircularCategoryView: View {
    let categories = ["🍐", "🍉", "🥕", "🍄"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories, id: \..self) { category in
                    VStack {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color(.systemGray4))
                            .overlay(Text(category).font(.title))
                        Text("Title")
                            .font(.caption)
                    }
                }
            }
        }
    }
}

struct ProductGridView: View {
    let products = Array(repeating: "Product name", count: 6)
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(products, id: \..self) { product in
                VStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray5))
                        .frame(height: 220)
                    Text("Brand")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(product)
                        .font(.headline)
                    Text("$10.99")
                        .font(.subheadline)
                        .bold()
                }
            }
        }
    }
    
}

#Preview {
    //HomeView(homeViewModel: ViewControllerFactory.shared.makeHomeViewModel())
}
