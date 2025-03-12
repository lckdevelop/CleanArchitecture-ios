# Clean Architecture
UIKit + SwiftUI 호환 가능한 프로젝트입니다.

## Architecture Overview
### MVVM + Clean Architecture
![Image](https://github.com/user-attachments/assets/cdbb835a-5a9d-4669-8761-ed4aeca0903c)

## Key Feature
### Dependency Injection
의존성 주입을 위해 Swinject 라이브러리를 사용하였습니다.

### Programmatic Navigation
SwiftUI 를 위한 프로그래밍방식의 네비게이션 기능입니다.
- 탭별 독립적인 네비게이션 스택 관리
- iOS 버전 호환성 (iOS 15+)
- 타입 세이프한 라우팅
- 프로그래밍 방식의 네비게이션 제어
  
```Swift
/**
 CustomNavigationContainer

iOS 버전에 따라 적절한 네비게이션 컨테이너를 제공하는 뷰입니다.
 
 iOS 16 이상에서는 NavigationStack을, iOS 15에서는 NavigationView를 사용합니다.
 
 - Parameters:
 - navigator: 네비게이션 경로를 관리하는 객체
 - content: 컨테이너의 루트 뷰
 - destination: 경로에 따른 목적지 뷰를 생성하기 위해 클로저로 선언했습니다.
 
 - Note: 단일 네비게이션 스택을 관리하며 iOS 버전 호환성을 보장합니다.
 */

// 실제 사용 예시
var body: some View {
    CustomNavigationContainer(
        navigator: router.couponNavigator,
        content: {
            CouponScreen(couponViewModel: couponViewModel)
        },
        destination: { route in
            switch route {
            case .couponDetail(let coupon):
                CouponDetailView(coupon: coupon)
            }
        }
        
    )
}
```

### WebView

### Deeplink
