//
//  LectureResultViewController.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit
import RxSwift
import RxDataSources

public class LectureResultViewController: UIViewController {
    @IBOutlet weak var lectureCountLabel: UILabel!
    @IBOutlet weak var lectureListTableView: UITableView!
    
    private var viewModel: LectureSearchResultViewModel
    private let disposeBag = DisposeBag()
    
    public init(viewModel: LectureSearchResultViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "LectureResultViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        setupBindings()
        setupNavigationBar()
        viewModel.didSearch()
    }

}

private extension LectureResultViewController {
    func setupDelegate() {
        lectureListTableView.delegate = self
        lectureListTableView.dataSource = self

        let nib = UINib(nibName: "LectureSearchCell", bundle: nil)
        lectureListTableView.register(nib, forCellReuseIdentifier: "LectureSearchCell")
        
    }
    
    func setupBindings() {
        viewModel.lectureList
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: { bool in
                let lectureCount = self.viewModel.lectureList.value.count
                self.lectureCountLabel.text = "\(lectureCount)개의 강좌가 검색 되었어요."
                
                self.lectureListTableView.reloadData()
                
            })
            .disposed(by: disposeBag)
    
                       
       viewModel.errors.subscribe(on: MainScheduler.instance)
            .bind { error in
               print("🚨Error Occurred: \(error)")
           }.disposed(by: disposeBag)
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.title = "강좌 검색 결과"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}

// MARK: - TableView Delegate
extension LectureResultViewController: UITableViewDelegate {
    
}
// MARK: - TableView DataSource

extension LectureResultViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.lectureList.value.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "LectureSearchCell",
            for: indexPath) as? LectureSearchCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let data = viewModel.lectureList.value[indexPath.row]
        cell.bindData(data: data, row: indexPath.row)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }

}

