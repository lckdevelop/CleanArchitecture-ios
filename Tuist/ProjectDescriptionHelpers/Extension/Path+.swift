//
//  Path+.swift
//  ProjectDescriptionHelpers
//
//  Created by Chaekyeong Lee on 1/29/25.
//

import ProjectDescription

public extension ProjectDescription.Path {
    static func relativeToFeature(_ path: String) -> Self {
        return .relativeToRoot("Projects/Features/\(path)")
    }
    
    static func relativeToDomain(_ path: String) -> Self {
        return .relativeToRoot("Projects/Domains/\(path)")
    }
    
    static func relativeToModule(_ path: String) -> Self {
        return .relativeToRoot("Projects/Modules/\(path)")
    }
    
    static func relativeToCore(_ path: String) -> Self {
        return .relativeToRoot("Projects/CoreKit/\(path)")
    }
    
    static var data: Self {
        return .relativeToRoot("Projects/Data")
    }
    
    static var domain: Self {
        return .relativeToRoot("Projects/Domains/Domain")
    }
    
    static var shared: Self {
        return .relativeToRoot("Projects/Shared")
    }
}
