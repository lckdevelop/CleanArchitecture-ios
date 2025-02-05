//
//  Dependency+Feature.swift
//  ProjectDescriptionHelpers
//
//  Created by Chaekyeong Lee on 1/29/25.
//

import ProjectDescription

// MARK: - Features
public extension TargetDependency {
    struct Features {
        public struct Root {}
        public struct Main {}
        public struct CultureCenter {}
        public struct Coupon {}
    }
    
}

public extension TargetDependency.Features {
    static func project(name: String) -> TargetDependency {
        return .project(target: name, path: .relativeToFeature(name))
    }
    
    static let BaseFeatureDependency = TargetDependency.project(target: "BaseFeature", path: .relativeToFeature("BaseFeature"))
    
    static let RootFeature = TargetDependency.project(target: "RootFeature", path: .relativeToFeature("RootFeature"))
}

public extension TargetDependency.Features.Main {
    static let name = "Main"
    
    static let Feature = TargetDependency.Features.project(name: "\(name)Feature")
    static let Interface = TargetDependency.project(target: "\(name)FeatureInterface", path: .relativeToFeature("\(name)Feature"))
}

public extension TargetDependency.Features.CultureCenter {
    static let name = "CultureCenter"
    
    static let Feature = TargetDependency.Features.project(name: "\(name)Feature")
    static let Interface = TargetDependency.project(target: "\(name)FeatureInterface", path: .relativeToFeature("\(name)Feature"))
}

public extension TargetDependency.Features.Coupon {
    static let name = "Coupon"
    
    static let Feature = TargetDependency.Features.project(name: "\(name)Feature")
    static let Interface = TargetDependency.project(target: "\(name)FeatureInterface", path: .relativeToFeature("\(name)Feature"))
}
