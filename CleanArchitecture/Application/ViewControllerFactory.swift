//
//  ViewControllerFactory.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit

protocol ViewControllerFactoryProtocol {
    func makeLectureSearchListVC() -> LectureResultViewController
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
}
