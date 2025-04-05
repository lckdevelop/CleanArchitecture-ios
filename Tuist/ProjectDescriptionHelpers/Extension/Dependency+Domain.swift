//
//  Dependency+Domain.swift
//  ProjectDescriptionHelpers
//
//  Created by Chaekyeong Lee on 1/29/25.
//

import ProjectDescription

public extension TargetDependency {
    struct Domains {}
}

public extension TargetDependency.Domains {
    static func project(name: String) -> TargetDependency {
        return .project(target: name, path: .relativeToDomain(name))
    }
}
