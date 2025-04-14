//
//  Workspace.swift
//  CleanArchitecture-iosManifests
//
//  Created by Chaekyeong Lee on 1/29/25.
//
import ProjectDescription

public struct InfoPlist {
    private static let commonInfoPlist: [String: Plist.Value] = [
        "CFBundleDevelopmentRegion": "ko",
        "CFBundleVersion": "1",
        "UILaunchStoryboardName": "LaunchScreen",
        "UIUserInterfaceStyle": "Light",
        "LSSupportsOpeningDocumentsInPlace": true,
        "ITSAppUsesNonExemptEncryption": false,
        "UIViewControllerBasedStatusBarAppearance": true,
        "UIStatusBarStyle": "UIStatusBarStyleDefault",
        "UIApplicationSupportsIndirectInputEvents": true,
        "UIApplicationSceneManifest": [
            "UIApplicationSupportsMultipleScenes": false,
            "UISceneConfigurations": [
                "UIWindowSceneSessionRoleApplication": [
                    [
                        "UISceneConfigurationName": "Default Configuration",
                        "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                    ],
                ]
            ]
        ]
    ]
    
    static func appInfoPlist(_ appConfiguration: AppConfiguration) -> [String: Plist.Value] {
        var infoPlist = commonInfoPlist
        infoPlist["CFBundleShortVersionString"] = .string(appConfiguration.shortVersion)
        infoPlist["CFBundleIdentifier"] = .string(appConfiguration.bundleIdentifier)
        infoPlist["CFBundleDisplayName"] = .string(appConfiguration.displayName)

        infoPlist["EHYUNDAI_BASE_URL"] = .string("$(EHYUNDAI_BASE_URL)")
        infoPlist["EHYUNDAI_APP_BASE_URL"] = .string("$(EHYUNDAI_APP_BASE_URL)")
        infoPlist["HPOINT_BASE_URL"] = .string("$(HPOINT_BASE_URL)")
        
        return infoPlist
    }
}
