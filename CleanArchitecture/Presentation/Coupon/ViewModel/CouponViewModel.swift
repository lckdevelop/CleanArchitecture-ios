//
//  CouponViewModel.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation
import Combine

// 쿠폰 관련 액션을 정의하는 열거형
enum CouponAction {
    case download(CouponEntity)
    case select(CouponEntity)
}
/**
MVVM 패턴에서 ViewModel 역할을 담당하는 클래스입니다.
1. 쿠폰 관련 비지니스 로직
2. UI 상태 관리를 합니다.

 - State: @Published 프로퍼티를 통해 View 에 자동 반영되어야하는 대상
 - Action : 사용자 인터페이스 관리 대상
 - Feature: 비지니스 로직 관리 대상
 */
final class CouponViewModel: ObservableObject {
    
    // MARK: - State
    @Published var couponList: CouponEntityList?
    @Published var downloadedCoupon: CouponEntity?
    
    @Published var showToast: Bool = false
    @Published var toastMessage: String?
    @Published var errorMessage: String?
    
    private let couponUsecase: CouponUsecaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(couponUsecase: CouponUsecaseProtocol) {
        self.couponUsecase = couponUsecase
    }
    
    // MARK: - Action
    func handleAction(_ action: CouponAction) {
        switch action {
        case .download(let coupon):
            downloadCoupon(coupon)
        case .select(_):
            // 선택 처리는 뷰에서 직접 처리
            break
        }
    }
    
    // MARK: - Feature
    func downloadCoupon(_ coupon: CouponEntity) {
        // 실제 다운로드 로직 구현 (API 호출 등) ~ 토스트 메세지만 표시
        self.downloadedCoupon = coupon
        self.toastMessage = "\(coupon.name ?? "") 쿠폰이 다운로드 되었습니다."
        self.showToast = true
        
        // 3초 후 토스트 메시지 숨기기
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showToast = false
        }
    }
    
    func loadCouponList() {
        let couponRequestDto = CouponRequestDTO(mcustNo: "", copnGbcd: "01", prfrYn: "N", ptcoId: nil)
        let response: AnyPublisher<CouponEntityList, Error> = couponUsecase.getCouponList(request: couponRequestDto)
        
        response
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    print("\(failure)")
                }
            }, receiveValue: { [weak self] coupons in
                self?.couponList = coupons
            })
            .store(in: &cancellables)
        
    }
}
