import Foundation
import CoreKit

public class PermissionViewModel: ObservableObject {
    @Published var cameraPermissionStatus: PermissionStatus = .notDetermined
    @Published var locationPermissionStatus: PermissionStatus = .notDetermined
    @Published var photoLibraryPermissionStatus: PermissionStatus = .notDetermined
    @Published var notificationPermissionStatus: PermissionStatus = .notDetermined
    
    public init() {
        checkInitialPermissions()
    }
    
    private func checkInitialPermissions() {
        checkCameraPermission()
        checkLocationPermission()
        checkPhotoLibraryPermission()
        checkNotificationPermission()
    }
    
    func checkCameraPermission() {
        PermissionManager.shared.checkPermission(.camera) { [weak self] status in
            DispatchQueue.main.async {
                self?.cameraPermissionStatus = status
            }
        }
    }
    
    func checkLocationPermission() {
        PermissionManager.shared.checkPermission(.location) { [weak self] status in
            DispatchQueue.main.async {
                self?.locationPermissionStatus = status
            }
        }
    }
    
    func checkPhotoLibraryPermission() {
        PermissionManager.shared.checkPermission(.photoLibrary) { [weak self] status in
            DispatchQueue.main.async {
                self?.photoLibraryPermissionStatus = status
            }
        }
    }
    
    func checkNotificationPermission() {
        PermissionManager.shared.checkPermission(.notification) { [weak self] status in
            DispatchQueue.main.async {
                self?.notificationPermissionStatus = status
            }
        }
    }
    
    func requestCameraPermission() {
        PermissionManager.shared.requestPermission(.camera) { [weak self] status in
            DispatchQueue.main.async {
                self?.cameraPermissionStatus = status
            }
        }
    }
    
    func requestLocationPermission() {
        PermissionManager.shared.requestPermission(.location) { [weak self] status in
            DispatchQueue.main.async {
                self?.locationPermissionStatus = status
            }
        }
    }
    
    func requestPhotoLibraryPermission() {
        PermissionManager.shared.requestPermission(.photoLibrary) { [weak self] status in
            DispatchQueue.main.async {
                self?.photoLibraryPermissionStatus = status
            }
        }
    }
    
    func requestNotificationPermission() {
        PermissionManager.shared.requestPermission(.notification) { [weak self] status in
            DispatchQueue.main.async {
                self?.notificationPermissionStatus = status
            }
        }
    }
} 
