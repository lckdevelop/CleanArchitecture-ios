//
//  CultureCenterWrapper.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import SwiftUI
import Swinject
import CoreKit
import Domain

public struct LectureResultViewWrapper: UIViewControllerRepresentable {
    public init() {}
    public func makeUIViewController(context: Context) -> LectureResultViewController {
        @Injected var cultureRepository: CultureRepositoryInterface
//        let coreDI = DIContainer.shared
//
//        // 의존성 주입
//        let repository = coreDI.resolve(CultureRepositoryInterface.self)!
        let useCase = CultureUseCase(cultureRepository: cultureRepository)
        let viewModel = CultureCenterViewModel(cultureUseCase: useCase)
        let vc = LectureResultViewController(cultureCenterViewModel: viewModel)
        
        return vc
    }

    public func updateUIViewController(_ uiViewController: LectureResultViewController, context: Context) {
        // 필요시 업데이트 로직 추가
    }
}
