//
//  XCConfig.swift
//  ProjectDescriptionHelpers
//
//  Created by Chaekyeong Lee on 1/29/25.
//

import ProjectDescription

public struct XCConfig {
    // MARK: 여긴 환경 구성 다시 하자
    private struct Path {
        static var framework: ProjectDescription.Path { .relativeToRoot("xcconfigs/targets/Staging.xcconfig") }
        
        static var tests: ProjectDescription.Path { .relativeToRoot("xcconfigs/targets/Development.xcconfig") }
        
        static func project(_ config: String) -> ProjectDescription.Path { //.relativeToRoot("xcconfigs/Base/Projects/Project-\(config).xcconfig") }
            .relativeToRoot("xcconfigs/Base/\(config).xcconfig") }
    }

    public static let framework: [Configuration] = [
        .release(name: "Development", xcconfig: Path.framework),
        .release(name: "Staging", xcconfig: Path.framework),
        .debug(name: "Release", xcconfig: Path.framework),
    ]
    
    public static let tests: [Configuration] = [
        .debug(name: "Development", xcconfig: Path.tests),
        .debug(name: "Staging", xcconfig: Path.tests),
        .release(name: "Release", xcconfig: Path.tests),
    ]
    
    public static let project: [Configuration] = [
        .release(name: "Development", xcconfig: Path.project("Development")),
        .release(name: "Staging", xcconfig: Path.project("Staging")),
        .debug(name: "Release", xcconfig: Path.project("Release")),
    ]

}
