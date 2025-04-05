//
//  CultureRepositoryInterface.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation
import Combine

public protocol CultureRepositoryInterface {
    func fetchSearchResult(cultureSearch: CultureSearch) -> AnyPublisher<[CultureLectureEntity], Error>
}



