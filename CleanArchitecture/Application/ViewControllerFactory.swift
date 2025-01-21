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
    
    func makeLectureSearchListVC() -> LectureResultViewController {
        let repository = DefaultCultureSearchResultRepository(cultureSearchService: CultureSearchService.shared)
        let usecase = DefaultCultureSearchListUseCase(repository: repository)
        let viewModel = DefaultLectureSearchResultViewModel(fetchCultureSearchUsecase: usecase)
        let vc = LectureResultViewController(viewModel: viewModel)
        return vc
    }
    
    // root VC 를 TabViewController 로 설정한다.
    func makeMainTabVC() -> MainTabViewController {
        let couponRepository = CouponRepository(networkManager: .shared)
        let couponService = CouponService(repository: couponRepository)
        let couponViewModel = CouponViewModel(couponService: couponService)
        let vc = MainTabViewController(couponViewModel: couponViewModel)
        
        return vc
    }
}
