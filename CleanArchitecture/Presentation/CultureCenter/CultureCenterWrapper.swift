//
//  CultureCenterWrapper.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/12/25.
//

import SwiftUI
import UIKit

struct LectureResultViewWrapper: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> LectureResultViewController {        
        return ViewControllerFactory.shared.makeLectureSearchListVC()
    }

    func updateUIViewController(_ uiViewController: LectureResultViewController, context: Context) {
        // 필요시 업데이트 로직 추가
    }
}
