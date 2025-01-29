//
//  Plugin.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/29/25.
//

@preconcurrency import ProjectDescription

public enum Environment {
    public static let workspaceName = "CleanArchitecture"
}

public extension Project {
    enum Environment {
        public static let workspaceName = "CleanArchitecture"
        public static let deploymentTarget = DeploymentTargets.iOS("14.0")
        public static let platform = Platform.iOS
        public static let bundlePrefix = "com.lck"
    }
}
