import SwiftUI
import CoreKit

struct PermissionScreen: View {
    @StateObject private var viewModel = PermissionViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("권한 관리")
                .font(.title)
                .padding(.top, 30)
            
            permissionButton(
                title: "카메라 권한",
                status: viewModel.cameraPermissionStatus,
                action: viewModel.requestCameraPermission
            )
            
            permissionButton(
                title: "위치 권한",
                status: viewModel.locationPermissionStatus,
                action: viewModel.requestLocationPermission
            )
            
            permissionButton(
                title: "사진 라이브러리 권한",
                status: viewModel.photoLibraryPermissionStatus,
                action: viewModel.requestPhotoLibraryPermission
            )
            
            permissionButton(
                title: "알림 권한",
                status: viewModel.notificationPermissionStatus,
                action: viewModel.requestNotificationPermission
            )
            
            Spacer()
        }
        .padding()
    }
    
    private func permissionButton(
        title: String,
        status: PermissionStatus,
        action: @escaping () -> Void
    ) -> some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.headline)
            
            Button(action: action) {
                HStack {
                    Text(status.description)
                    Image(systemName: status.iconName)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(status.backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

private extension PermissionStatus {
    var description: String {
        switch self {
        case .notDetermined:
            return "권한 요청하기"
        case .authorized:
            return "권한 허용됨"
        case .denied:
            return "권한 거부됨"
        case .restricted:
            return "권한 제한됨"
        }
    }
    
    var iconName: String {
        switch self {
        case .notDetermined:
            return "questionmark.circle"
        case .authorized:
            return "checkmark.circle"
        case .denied:
            return "xmark.circle"
        case .restricted:
            return "exclamationmark.circle"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .notDetermined:
            return .blue
        case .authorized:
            return .green
        case .denied:
            return .red
        case .restricted:
            return .orange
        }
    }
} 