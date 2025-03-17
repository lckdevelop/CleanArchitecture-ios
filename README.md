# Clean Architecture
UIKit + SwiftUI 호환 가능한 프로젝트입니다. 클린 아키텍처 원칙을 준수하여 유지보수성과 테스트 용이성을 높였습니다.
<details>
  <summary>프로젝트 Tree 구조</summary>
  
  ```
  ./CleanArchitecture
  ├── Application
  │   ├── AppDelegate.swift
  │   ├── SceneDelegate.swift
  │   └── ViewControllerFactory.swift
  ├── Core
  │   ├── Dependency
  │   │   └── DIContainer.swift
  │   ├── Navigation
  │   │   ├── AppRouter.swift
  │   │   ├── CouponRoute.swift
  │   │   ├── CultureCenterRoute.swift
  │   │   ├── CustomNavigationContainer.swift
  │   │   ├── HomeRoute.swift
  │   │   └── NavigationProtocol.swift
  │   └── Util
  │       └── StringExtension.swift
  ├── Data
  │   ├── Model
  │   │   ├── Coupon
  │   │   ├── CultureCenter
  │   │   ├── Home
  │   │   └── bridge
  │   ├── Network
  │   │   ├── API
  │   │   ├── Common
  │   │   ├── Config
  │   │   ├── Foundation
  │   │   └── Service
  │   ├── Repository
  │   │   ├── Coupon
  │   │   ├── CultureCenter
  │   │   ├── DefaultCultureSearchResultRepository.swift
  │   │   └── HomeRepository.swift
  │   └── Transform
  │       └── HomeTransform.swift
  ├── Domain
  │   ├── Entity
  │   │   ├── Coupon
  │   │   ├── CultureLecture.swift
  │   │   ├── FoodBanner.swift
  │   │   └── HomeEntity.swift
  │   ├── Interface
  │   │   ├── CultureSearchResultRepository.swift
  │   │   └── HomeRepositoryInterface.swift
  │   └── UseCase
  │       ├── CouponUsecase.swift
  │       ├── CultureSearchListUseCase.swift
  │       └── HomeUseCase.swift
  ├── Global
  │   ├── Resources
  │   │   └── Assets.xcassets
  │   └── SupportingFiles
  │       ├── Base.lproj
  │       └── Info.plist
  └── Presentation
      ├── Common
      │   ├── Button
      │   ├── CustomNavigationBar.swift
      │   ├── NavigationTitle.swift
      │   └── ToastView.swift
      ├── Coupon
      │   ├── Screen
      │   ├── ViewModel
      │   └── Views
      ├── CultureCenter
      │   ├── View
      │   ├── ViewController
      │   ├── ViewModel
      │   └── CultureCenterWrapper.swift
      ├── Home
      │   ├── HomeScreen.swift
      │   └── HomeViewModel.swift
      ├── MainTab
      │   ├── MainTabType.swift
      │   └── MainTabViewController.swift
      ├── WebView
      │   └── BaseWebView.swift
      └── base
          ├── Intro.storyboard
          └── IntroViewController.swift
  ```
</details>


## Architecture Overview
### MVVM + Clean Architecture
![Image](https://github.com/user-attachments/assets/35739f26-2641-456d-8546-4a743c67806f)
### 계층 구조
프로젝트는 다음 4개의 주요 계층으로 구성되어 있습니다
1. Presentation Layer
- SwiftUI Views, ViewModels
- 사용자 인터페이스 및 사용자 입력 처리
- Domain Layer에만 의존
2. Domain Layer
- Entitiey, UseCases, Repository Interfaces
- 비즈니스 로직 및 규칙 포함
- 다른 계층에 의존하지 않음 (독립적)
3. Data Layer
- Repositories, DTO
- 데이터 소스 추상화 및 데이터 변환
4. Network Layer
- Services, API Clients
- 외부 API와의 통신 담당
- Moya를 활용한 네트워크 요청 추상화

### 의존성 역전 원칙
> Domain Layer는 외부 계층에 의존하지 않고, 대신 인터페이스(Repository Interface)를 통해 의존성을 역전시킵니다. 이를 통해 도메인 로직이 외부 구현 세부사항으로부터 독립적으로 유지됩니다.


## Key Feature
### Dependency Injection
의존성 주입을 위해 Swinject 라이브러리를 사용하였습니다.
클린아키텍처로 작업하다보면 의존성주입중 의존성역전에 의해 인스턴스 생성에 따라서 파라미터가 끊임없이 늘어납니다. 이걸 해결하려면 DIContainer 를 만들어서 앱이 실행할때 모든 의존성 주입이 필요한 인스턴스를 초기화시켜놓고 싱글톤으로 사용하면 됩니다.

```Swift
class DIContainer: ObservableObject {
    static let shared = DIContainer()
    let container: Container
    
    private init() {
        container = Container()
    }
    
    func registerDependencies() {
        // 모든 Assembly 등록
        let assemblies: [Assembly] = [
            NetworkAssembly(),
            CouponAssembly(),
            HomeAssembly()
            // 추후 다른 모듈의 Assembly 등록
        ]
        
        // Assembly 실행
        assemblies.forEach { $0.assemble(container: container) }
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        container.resolve(T.self)
    }
}
```

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

## 모듈화
프로젝트의 확장성과 유지보수성을 높이기 위해 Configuration을 분리하고 Tuist 모듈화를 준비하는 과정에 있습니다.
### Configuration

