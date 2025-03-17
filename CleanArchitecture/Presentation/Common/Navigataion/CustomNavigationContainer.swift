import SwiftUI

/**
 iOS 버전에 따라 적절한 네비게이션 컨테이너를 제공하는 뷰입니다.
 
 iOS 16 이상에서는 NavigationStack을, iOS 15에서는 NavigationView를 사용합니다.
 
 - Parameters:
 - navigator: 네비게이션 경로를 관리하는 객체
 - content: 컨테이너의 루트 뷰
 - destination: 경로에 따른 목적지 뷰를 생성하기 위해 클로저로 선언했습니다.
 
 - Note: 단일 네비게이션 스택을 관리하며 iOS 버전 호환성을 보장합니다.
 */
struct CustomNavigationContainer<R: NavigationRoute, Content: View, Destination: View>: View {
    @ObservedObject var navigator: TabNavigationManager<R>
    let content: Content
    let destination: (R) -> Destination
    
    init(
        navigator: TabNavigationManager<R>,
        @ViewBuilder content: () -> Content,
        @ViewBuilder destination: @escaping (R) -> Destination
    ) {
        self.navigator = navigator
        self.content = content()
        self.destination = destination
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            // iOS 16 이상에서는 NavigationStack 사용
            NavigationStack(path: $navigator.routes) {
                content.navigationDestination(for: R.self) { route in
                    destination(route)
                }
            }
        } else {
            // iOS 15에서는 NavigationView 사용
            NavigationView {
                let activeRoute = navigator.routes
                // NavigationLink 간헐적으로 네비게이션 링크를 통해 뷰 전환이 되어도 바로 해당 뷰를 빠져나옴.
                // 버그 대응을 위해 EmptyView(), hidden() 설정 필요
                NavigationLink(destination: destination(activeRoute.last!)) {
                    EmptyView()
                }
                .hidden()
                
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
