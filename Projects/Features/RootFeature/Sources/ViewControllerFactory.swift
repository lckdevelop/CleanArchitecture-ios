//
//  ViewControllerFactory.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit
import Core
import Domain
import Data
import CultureCenterFeature
import CouponFeature

protocol ViewControllerFactoryProtocol {
    func makeLectureSearchListVC() -> LectureResultViewController
    func makeMainTabVC() -> MainTabViewController
}

public final class ViewControllerFactory: ViewControllerFactoryProtocol {
    
    public static let shared = ViewControllerFactory()
    private init() { }
    
    public func makeLectureSearchListVC() -> LectureResultViewController {
        let repository = DefaultCultureSearchResultRepository(cultureSearchService: CultureSearchService.shared)
        let usecase = DefaultCultureSearchListUseCase(repository: repository)
        let viewModel = DefaultLectureSearchResultViewModel(fetchCultureSearchUsecase: usecase)
        let vc = LectureResultViewController(viewModel: viewModel)
        return vc
    }
    
    // root VC 를 TabViewController 로 설정한다.
    public func makeMainTabVC() -> MainTabViewController {
        let couponRepository = CouponRepository(networkManager: .shared)
        let couponService = CouponService(repository: couponRepository)
        let couponViewModel = CouponViewModel(couponService: couponService)
        let vc = MainTabViewController(couponViewModel: couponViewModel)
        
        return vc
    }
}
