//
//  LectureResultViewController.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit

class LectureResultViewController: UIViewController {
    private var viewModel: LectureSearchResultViewModel

    init(viewModel: LectureSearchResultViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "LectureResultViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.didSearch()

    }
}
