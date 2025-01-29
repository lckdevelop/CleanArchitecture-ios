//
//  Dependency+Library.swift
//  ProjectDescriptionHelpers
//
//  Created by Chaekyeong Lee on 1/29/25.
//

import ProjectDescription

public extension TargetDependency {
    struct Library {}
}

public extension TargetDependency.Library {
    static let moya = TargetDependency.external(name: "Moya")
    static let alamofire = TargetDependency.external(name: "Alamofire")
    static let rxSwift = TargetDependency.external(name: "RxSwift")
    static let rxDataSources = TargetDependency.external(name: "RxDataSources")
    static let kingfisher = TargetDependency.external(name: "Kingfisher")
    static let snapKit = TargetDependency.external(name: "SnapKit")
}
