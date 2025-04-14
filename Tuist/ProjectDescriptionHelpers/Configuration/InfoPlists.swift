//
//  Workspace.swift
//  CleanArchitecture-iosManifests
//
//  Created by Chaekyeong Lee on 1/29/25.
//
import ProjectDescription

/// Info.plist 설정을 관리하는 구조체
/// - Note: 앱의 모든 Info.plist 설정은 이곳에서 관리합니다.
public struct InfoPlist {
    /// 모든 타겟에서 공통으로 사용되는 Info.plist 설정
    /// - Important: 새로운 권한이나 설정을 추가할 때는 이 딕셔너리에 추가하세요.
    private static let commonInfoPlist: [String: Plist.Value] = [
        // MARK: - 기본 설정
        "CFBundleDevelopmentRegion": "ko",
        "CFBundleVersion": "1",
        "UILaunchStoryboardName": "LaunchScreen",
        "UIUserInterfaceStyle": "Light",
        "LSSupportsOpeningDocumentsInPlace": true,
        "ITSAppUsesNonExemptEncryption": false,
        
        // MARK: - UI 관련 설정
        "UIViewControllerBasedStatusBarAppearance": true,
        "UIStatusBarStyle": "UIStatusBarStyleDefault",
        "UIApplicationSupportsIndirectInputEvents": true,
        
        // MARK: - 권한 관련 설명
        /// 카메라 사용 권한 설명
        "NSCameraUsageDescription": "카메라 접근 권한이 필요합니다.",
        /// 사진 라이브러리 사용 권한 설명
        "NSPhotoLibraryUsageDescription": "사진 라이브러리 접근 권한이 필요합니다.",
        /// 위치 정보 사용 권한 설명 (앱 사용 중)
        "NSLocationWhenInUseUsageDescription": "위치 정보 접근 권한이 필요합니다.",
        /// 위치 정보 사용 권한 설명 (항상)
        "NSLocationAlwaysAndWhenInUseUsageDescription": "백그라운드 위치 정보 접근 권한이 필요합니다.",
        
        // MARK: - Scene 설정
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
    
    /// 앱 설정에 따른 Info.plist 설정을 생성합니다.
    /// - Parameter appConfiguration: 앱 설정 정보
    /// - Returns: 완성된 Info.plist 설정
    static func appInfoPlist(_ appConfiguration: AppConfiguration) -> [String: Plist.Value] {
        var infoPlist = commonInfoPlist
        
        // MARK: - 앱 식별자 설정
        infoPlist["CFBundleShortVersionString"] = .string(appConfiguration.shortVersion)
        infoPlist["CFBundleIdentifier"] = .string(appConfiguration.bundleIdentifier)
        infoPlist["CFBundleDisplayName"] = .string(appConfiguration.displayName)

        // MARK: - API 엔드포인트 설정
        infoPlist["EHYUNDAI_BASE_URL"] = .string("$(EHYUNDAI_BASE_URL)")
        infoPlist["EHYUNDAI_APP_BASE_URL"] = .string("$(EHYUNDAI_APP_BASE_URL)")
        infoPlist["HPOINT_BASE_URL"] = .string("$(HPOINT_BASE_URL)")
        
        return infoPlist
    }
}
