//
//  AppConfiguration.swift
//  ProjectDescriptionHelpers
//
//  Created by Chaekyeong Lee on 1/29/25.
//

import Foundation
import ProjectDescription

public struct AppConfiguration {
    
    public init() {}
    
    let workspaceName = "CleanArchitecture"
    let projectName: String = "CleanArchitecture"
    //let organizationName = ""
    let shortVersion: String = "1.0.0"
    let bundleIdentifier: String = "com.lck.CleanArchitecture"
    let displayName: String = "CleanArchitecture"
    let destination: Set<Destination> = [.iPhone]
    var entitlements: Entitlements? = nil
    let deploymentTarget: DeploymentTargets = .iOS("14.0")
    
    public var configurationName: ConfigurationName {
        return "CleanArchitecture"
    }
    
    var infoPlist: [String : Plist.Value] {
        InfoPlist.appInfoPlist(self)
    }
    
//    public var autoCodeSigning: SettingsDictionary {
//        return SettingsDictionary().automaticCodeSigning(devTeam: "DD8KP9C4KQ")
//    }
    
    var setting: Settings {
        return Settings.settings(
            //base: autoCodeSigning,
            configurations: XCConfig.project
        )
    }
    
    let commonSettings = Settings.settings(
//        base: SettingsDictionary.debugSettings
//            .configureAutoCodeSigning()
//            .configureVersioning()
//            .configureTestability(),
        configurations: XCConfig.framework
    )
}

