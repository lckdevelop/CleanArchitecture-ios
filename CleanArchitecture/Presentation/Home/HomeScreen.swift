//
//  HomeScreen.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/2/25.
//

import SwiftUI
import Combine
import Kingfisher

struct HomeScreen: View {
    @EnvironmentObject private var router: AppRouter
    @ObservedObject var homeViewModel: HomeViewModel
    //@State private var hideTabBar:Bool = false // 돌아왔을떄 먼저 그려져 있기 바라는데..
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    SearchBar()
                    
                    // Shopping Info
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Shopping Info")
                                .font(.headline)
                                .bold()
                            Spacer()
                            //if let url = URL(string: "http://127.0.0.1:5500/index.html") {
                                NavigationLink(destination: {
                                     BaseWebView(url: "http://127.0.0.1:5500/index.html", navTitle: NavigationTitle.WEB_SHOPPING_TITLE)
                                }) {
                                    Text("더보기 >")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            //}
                        }
                        .padding(.horizontal)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(homeViewModel.trendBannerList ?? [], id: \.title) { banner in
                                    Button(action: {
                                        router.navigate(.push, route: HomeRoute.shoppingInfoDetail(banner))
                                    }) {
                                        
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
                    
                    // 현대식품관 투홈
                    VStack(alignment: .leading) {
                        HStack {
                            Text("현대식품관 투홈")
                                .font(.headline)
                                .bold()
                            Spacer()
                            //if let url = URL(string: LinkUrl.WEB_TO_HOME) {
                                NavigationLink(destination: BaseWebView(url: LinkUrl.WEB_TO_HOME, navTitle: NavigationTitle.WEB_TO_HOME_TITLE)) {
                                    Text("더보기 >")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            //}

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
                                Button(action: {
                                    router.navigate(.push, route: HomeRoute.foodDetail(banner))
                                }) {
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


#Preview {
    //HomeView(homeViewModel: ViewControllerFactory.shared.makeHomeViewModel())
}
