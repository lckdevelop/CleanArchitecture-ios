//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Chaekyeong Lee on 1/30/25.
//

import ProjectDescription

public extension TargetDependency {
    struct Modules {}
    struct Core {}
}

// MARK: - Root
public extension TargetDependency {
    static let data = TargetDependency.project(target: "Data", path: .data)
    static let domain = TargetDependency.project(target: "Domain", path: .domain)
    //static let core = TargetDependency.project(target: "Core", path: .core) // designkit도 넣어야하나?
    static let core = TargetDependency.project(target: "Core", path: .relativeToCore("Core"))
}

// MARK: - Modules
public extension TargetDependency.Modules {
    static let shared = TargetDependency.project(target: "Shared", path: .relativeToModule("Shared"))
    static let networkModule = TargetDependency.project(target: "NetworkModule", path: .relativeToModule("NetworkModule"))
    static let thirdPartyLibrary = TargetDependency.project(target: "ThirdPartyLibrary", path: .relativeToModule("ThirdPartyLibrary"))
}

// MARK: - Core
public extension TargetDependency.Core {
    static let designKit = TargetDependency.project(target: "DesignKit", path: .relativeToCore("DesignKit"))
    static let coreKit = TargetDependency.project(target: "CoreKit", path: .relativeToCore("CoreKit"))
    
//    static let designKit = TargetDependency.project(target: "DesignKit", path: .relativeToCore("DesignKit"))
//    static let core = TargetDependency.project(target: "Core", path: .core)
}

