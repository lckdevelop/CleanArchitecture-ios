//
//  ViewControllerFactory.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit

protocol ViewControllerFactoryProtocol {
    func makeLectureSearchListVC() -> LectureResultViewController
    func makeMainTabVC() -> MainTabViewController
}

final class ViewControllerFactory: ViewControllerFactoryProtocol {
    
    static let shared = ViewControllerFactory()
    private init() { }
    
    // MARK: 홈화면 swiftui 하면서 di하는것이 필요한데 임시적으로 일단 viewmodel을 여기에서 리턴하자.
    func makeHomeViewModel() -> HomeViewModel {
        let repository = HomeRepository(homeService: HomeService())
        let usecase = HomeInfoUseCase(repository: repository)
        let viewModel = HomeViewModel(homeInfoUseCase: usecase)

        return viewModel
    }
    
    func makeLectureSearchListVC() -> LectureResultViewController {
        let repository = DefaultCultureSearchResultRepository(cultureSearchService: CultureSearchService.shared)
        let usecase = DefaultCultureSearchListUseCase(repository: repository)
        let viewModel = DefaultLectureSearchResultViewModel(fetchCultureSearchUsecase: usecase)
        let vc = LectureResultViewController(viewModel: viewModel)
        return vc
    }
    
    // root VC 를 TabViewController 로 설정한다.
    func makeMainTabVC() -> MainTabViewController {
        let repository = CouponRepository(networkManager: .shared)
        let usecase = CouponUsecase(repository: repository)
        let couponViewModel = CouponViewModel(couponService: usecase)
        
        return MainTabViewController(couponViewModel: couponViewModel)
    }
}
