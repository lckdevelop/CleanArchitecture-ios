//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Chaekyeong Lee on 1/30/25.
//

import ProjectDescription

public extension Dep {
    struct Modules {}
    struct Core {}
}

// MARK: - Root
public extension Dep {
    static let data = Dep.project(target: "Data", path: .data)
    static let domain = Dep.project(target: "Domain", path: .domain)
    static let core = Dep.project(target: "Core", path: .relativeToCore("Core")) // designkit도 넣어야하나?
}

// MARK: - Modules
public extension Dep.Modules {
    static let shared = TargetDependency.project(target: "Shared", path: .relativeToModule("Shared"))
    static let networkModule = TargetDependency.project(target: "NetworkModule", path: .relativeToModule("NetworkModule"))
    static let thirdPartyLibrary = TargetDependency.project(target: "ThirdPartyLibrary", path: .relativeToModule("ThirdPartyLibrary"))
}

// MARK: - Core
public extension Dep.Core {
    static let designKit = TargetDependency.project(target: "DesignKit", path: .relativeToCore("DesignKit"))
    static let core = TargetDependency.project(target: "Core", path: .relativeToCore("Core"))
}

