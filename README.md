# Clean Architecture
UIKit + SwiftUI 호환 가능한 프로젝트입니다. 
클린 아키텍처 원칙을 준수하였으며 소프트웨어의 유지보수성, 테스트 용이성 및 모듈 간의 분리를 강조하여 구조화된 방식으로 개발하였습니다.

## Clean Architecture 주요 원칙
### 1. 의존성 역전 원칙 (Dependency Inversion Principle, DIP)
> 고수준 모듈은 저수준 모듈에 의존해서는 안되며, 양쪽 모듈 모두 추상화에 의존해야 합니다. 또한 추상화는 세부 사항에 의존하지 않아야합니다. 세부 사항이 추상화에 의존해야 한다.이를 통해 느슨한 결합을 유지할 수 있습니다. Ex) Domain Layer의 구현체는 외부 계층에 의존하지 않고, 대신 인터페이스(Repository Interface)를 통해 의존성을 역전시킵니다. 이를 통해 도메인 로직이 외부 구현 세부사항으로부터 독립적으로 유지됩니다. 

### 2. 경계(Boundary)의 분리
> 소프트웨어 시스템을 여러 개의 영역(계층)으로 나누고, 각 영역 간의 명확한 인터페이스(경계)를 정의합니다.
각 영역은 독립적으로 개발/테스트/변경 가능해야 하며, 다른 영역과는 인터페이스를 통해서만 통신해야 합니다.

### 3. 인터페이스 분리 원칙 (Interface Segregation Principle, ISP)
> 클라이언트(사용자 클래스)는 자신이 사용하지 않는 메서드에 의존하면 안 됩니다. 즉, 하나의 커다란 인터페이스보다는, 작고 구체적인 인터페이스로 분리하는 것이 바람직합니다.


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

## Used Technology 
1. Architecture : Clean Architecture
2. IOS Framework & Reactive Programming : UIKit + Rxswift, SwiftUI + Combine
3. Design Pattern : MVVM
4. Code Convention : SwiftLint
5. Modularization : Tuist(예정)
6. Configuration Separation: Development, Staging, Production
7. Library & Framework : 
- Moya - 네트워크 통신
- Kingfisher - 비동기 이미지 로딩& 캐싱
- Swinject - 의존성 주입
- RxSwift - 반응형 프로그래밍
- Combine - 반응형 프로그래밍
- 
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

### Network Library Moya
네트워크 통신 라이브러리로 Moya를 채택하였습니다.

Moya는 네트워크 요청을 관리하고 추상화하는 데 유용한 라이브러리입니다. Moya를 사용하면 네트워크 코드의 유지 보수성과 재사용성을 높일 수 있으며, 코드의 가독성도 향상시킬 수 있습니다.
네트워크 통신을 할때 `MoyaProvider` 객체를 사용하여 네트워크 요청을 하게 됩니다.
`MoyaProvider`는 `TargetType`을 기반으로 HTTP 요청을 만들어서 서버와 통신하게됩니다.
`TargetType을 채택하게 되면` baseURL, path, method, task, headers 등을 개발자가 정의 할 수 있습니다.

`MoyaLoggingPlugin`은 `Moya`의 **Plugin 시스템** 중 하나로, 네트워크 요청과 응답에 대한 로그를 출력하는 부분을 커스텀하여 사용하였습니다.
이 외에도 인증 설정, 네트워크 통신 요청 빈도 수 제한 등 다양한 플러그인이 있습니다.


### WebView
SwiftUI는 주로 **UI 컴포넌트**와 **레이아웃 관리**에 집중하는 프레임워크로 WebView와 같은 외부 뷰를 직접적으로 지원하는 기능은 포함되어 있지 않습니다. WebView를 SwiftUI에서 사용하고 싶다면, UIKit의 `WKWebView`를 SwiftUI에서 사용할 수 있도록 `UIViewRepresentable`을 이용해 래핑(wrapping)하여 사용할 수 있습니다.

- 파일명 : BaseWebView - UIScreen
- 파일명 : WebViewWrapper - `UIViewRepresentable`을 이용해 설정관련되어 래핑(wrapping)
- 파일명 : WebViewContentController - Javascript ↔ Native handler 설정

### Bridge
네이티브 코드와 웹/자바스크립트 간의 상호작용을 위한 BridgeManager 클래스를 생성하였습니다.
자바스크립트 → 네이티브로 이동할 때는 커멘드(cmd), 데이터(param), 콜백(callback)을 전송합니다.
데이터에는 화면띄우는 방식도 포함하여, 방식에 따라 네비게이션에 의해 이동될지, 모달로 띄울지 결정되게 됩니다.
또한 화면전환 방식을 프로토콜로 생성해 놓고, RootRouter에서 정의하여 화면전환이 일어날때는 각각의 Router에서는 해당 방식으로 화면 전환을 할 수 있도록 구현하였습니다.

### Configuration
다양한 환경 관리을 관리하기 위해서 서버 환경(Release, Staging, Dev)에 따라 설정을 분리하였습니다.
코드 수정없이 조건에 따라 다른 값을 설정할 수 있는 build configuration을 분리 적용하였습니다.

- CleanArchitecture : 운영 환경
- CleanArchitecture - Staging : 스테이징 환경
- CleanArchitecture - Dev : 개발 환경
  
### 모듈화
프로젝트의 확장성과 유지보수성을 높이기 위해 Tuist 모듈화를 준비하는 과정에 있습니다.




