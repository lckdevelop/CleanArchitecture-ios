import Foundation
import Photos
import AVFoundation
import UserNotifications
import CoreLocation

/// OS 권한 관리를 위한 타입 정의
/// - Note: 새로운 권한이 필요한 경우 이 enum에 case를 추가하세요.
public enum PermissionType {
    /// 카메라 접근 권한
    case camera
    /// 사진 라이브러리 접근 권한
    case photoLibrary
    /// 푸시 알림 권한
    case notification
    /// 위치 정보 접근 권한
    case location

    // 필요한 권한 타입 추가..
}

/// OS 권한 상태를 나타내는 enum
public enum PermissionStatus {
    /// 권한이 허용된 상태
    case authorized
    /// 권한이 거부된 상태
    case denied
    /// 권한이 아직 결정되지 않은 상태
    case notDetermined
    /// 권한이 제한된 상태 (시스템에 의해)
    case restricted
}

/// OS 권한 관리를 담당하는 매니저 클래스
/// - Note: 싱글톤 패턴으로 구현되어 있으며, 앱에서 필요한 모든 권한 관리를 중앙화하여 처리합니다.
///
/// ## 사용 예시:
/// ```swift
/// // 권한 체크
/// PermissionManager.shared.checkPermission(.camera) { status in
///     switch status {
///     case .authorized:
///         // 권한이 허용된 경우의 처리
///         break
///     case .denied:
///         // 권한이 거부된 경우의 처리
///         break
///     }
/// }
///
/// // 권한 요청
/// PermissionManager.shared.requestPermission(.camera) { status in
///     // 권한 요청 결과 처리
/// }
/// ```
public class PermissionManager: NSObject, CLLocationManagerDelegate {
    /// 싱글톤 인스턴스
    public static let shared = PermissionManager()
    
    /// 위치 관리자
    private var locationManager: CLLocationManager?
    
    /// 위치 권한 요청 완료 핸들러
    private var locationCompletion: ((PermissionStatus) -> Void)?
    
    private override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    
    /// 특정 권한의 현재 상태를 확인합니다.
    /// - Parameters:
    ///   - type: 확인할 권한 타입
    ///   - completion: 권한 상태를 전달받을 완료 핸들러
    public func checkPermission(_ type: PermissionType, completion: @escaping (PermissionStatus) -> Void) {
        switch type {
        case .camera:
            checkCameraPermission(completion: completion)
        case .photoLibrary:
            checkPhotoLibraryPermission(completion: completion)
        case .notification:
            checkNotificationPermission(completion: completion)
        case .location:
            checkLocationPermission(completion: completion)
        }
    }
    
    /// OS 권한을 요청합니다.
    /// - Parameters:
    ///   - type: 요청할 권한 타입
    ///   - completion: 권한 요청 결과를 전달받을 완료 핸들러
    public func requestPermission(_ type: PermissionType, completion: @escaping (PermissionStatus) -> Void) {
        switch type {
        case .camera:
            requestCameraPermission(completion: completion)
        case .photoLibrary:
            requestPhotoLibraryPermission(completion: completion)
        case .notification:
            requestNotificationPermission(completion: completion)
        case .location:
            requestLocationPermission(completion: completion)
        }
    }
    
    // MARK: - Private Methods
    
    /// 카메라 권한 상태를 확인합니다.
    private func checkCameraPermission(completion: @escaping (PermissionStatus) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            completion(.authorized)
        case .denied:
            completion(.denied)
        case .notDetermined:
            completion(.notDetermined)
        case .restricted:
            completion(.restricted)
        @unknown default:
            completion(.denied)
        }
    }
    
    /// 사진 라이브러리 권한 상태를 확인합니다.
    private func checkPhotoLibraryPermission(completion: @escaping (PermissionStatus) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            completion(.authorized)
        case .denied:
            completion(.denied)
        case .notDetermined:
            completion(.notDetermined)
        case .restricted:
            completion(.restricted)
        case .limited:
            completion(.authorized)
        @unknown default:
            completion(.denied)
        }
    }
    
    /// 푸시 알림 권한 상태를 확인합니다.
    private func checkNotificationPermission(completion: @escaping (PermissionStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                switch settings.authorizationStatus {
                case .authorized:
                    completion(.authorized)
                case .denied:
                    completion(.denied)
                case .notDetermined:
                    completion(.notDetermined)
                case .provisional:
                    completion(.authorized)
                case .ephemeral:
                    completion(.authorized)
                @unknown default:
                    completion(.denied)
                }
            }
        }
    }
    
    /// 카메라 권한을 요청합니다.
    private func requestCameraPermission(completion: @escaping (PermissionStatus) -> Void) {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                completion(granted ? .authorized : .denied)
            }
        }
    }
    
    /// 사진 라이브러리 권한을 요청합니다.
    private func requestPhotoLibraryPermission(completion: @escaping (PermissionStatus) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    completion(.authorized)
                case .denied:
                    completion(.denied)
                case .notDetermined:
                    completion(.notDetermined)
                case .restricted:
                    completion(.restricted)
                case .limited:
                    completion(.authorized)
                @unknown default:
                    completion(.denied)
                }
            }
        }
    }
    
    /// 푸시 알림 권한을 요청합니다.
    private func requestNotificationPermission(completion: @escaping (PermissionStatus) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            DispatchQueue.main.async {
                completion(granted ? .authorized : .denied)
            }
        }
    }
    
    /// 위치 정보 권한 상태를 확인합니다.
    private func checkLocationPermission(completion: @escaping (PermissionStatus) -> Void) {
        guard let locationManager = locationManager else {
            completion(.denied)
            return
        }
        
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            completion(.authorized)
        case .denied:
            completion(.denied)
        case .notDetermined:
            completion(.notDetermined)
        case .restricted:
            completion(.restricted)
        @unknown default:
            completion(.denied)
        }
    }
    
    /// 위치 정보 권한을 요청합니다.
    private func requestLocationPermission(completion: @escaping (PermissionStatus) -> Void) {
        locationCompletion = completion
        locationManager?.requestWhenInUseAuthorization()
    }
    
    // MARK: - CLLocationManagerDelegate
    
    /// 위치 권한 상태가 변경되었을 때 호출되는 델리게이트 메서드
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationCompletion?(.authorized)
        case .denied:
            locationCompletion?(.denied)
        case .notDetermined:
            locationCompletion?(.notDetermined)
        case .restricted:
            locationCompletion?(.restricted)
        @unknown default:
            locationCompletion?(.denied)
        }
        locationCompletion = nil
    }
} 
