//
//  LectureResultViewController.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit
import Domain
import Combine

public class LectureResultViewController: UIViewController {
    @IBOutlet weak var lectureCountLabel: UILabel!
    @IBOutlet weak var lectureListTableView: UITableView!
    
    private var cultureCenterViewModel: CultureCenterViewModelProtocol
    private var cancellables = Set<AnyCancellable>()
    
    public init(cultureCenterViewModel: CultureCenterViewModel) {
        self.cultureCenterViewModel = cultureCenterViewModel
        super.init(nibName: "LectureResultViewController", bundle: .module)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        setupBindings()
        setupNavigationBar()
        cultureCenterViewModel.searchCultureList()
    }

}

private extension LectureResultViewController {
    func setupDelegate() {
        lectureListTableView.delegate = self
        lectureListTableView.dataSource = self
        
        let nib = UINib(nibName: "LectureSearchCell", bundle: .module)
        lectureListTableView.register(nib, forCellReuseIdentifier: "LectureSearchCell")
        
    }
    
    func setupBindings() {
        cultureCenterViewModel.lectureListPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] lectureList in
                guard let self = self else { return }
                self.lectureCountLabel.text = "\(lectureList.count)개의 강좌가 검색 되었어요."
                self.lectureListTableView.reloadData()
            }
            .store(in: &cancellables)

        cultureCenterViewModel.errorPublisher
            .receive(on: RunLoop.main)
            .sink { error in
                print("🚨Error Occurred: \(error)")
                // 필요시 alert 띄우기 등
            }
            .store(in: &cancellables)
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

extension LectureResultViewController: UITableViewDelegate {}

// MARK: - TableView DataSource

extension LectureResultViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cultureCenterViewModel.lectureListValue.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "LectureSearchCell",
            for: indexPath) as? LectureSearchCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        let data = cultureCenterViewModel.lectureListValue[indexPath.row]
        cell.bindData(data: data, row: indexPath.row)
        return cell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}

