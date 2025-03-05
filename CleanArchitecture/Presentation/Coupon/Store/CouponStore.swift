//
//  CouponStore.swift
//  CleanArchitecture
//
//  Created by 김서진 on 3/5/25.
//

import SwiftUI
import Combine

// 쿠폰 관련 액션을 정의하는 열거형
enum CouponAction {
    case download(Coupon)
    case select(Coupon)
}

final class CouponStore: ObservableObject {
    // State 관리
    @Published var couponList: CouponList?
    @Published var errorMessage: String?
    @Published var toastMessage: String = ""
    @Published var showToast: Bool = false
    @Published var downloadedCoupon: Coupon?

    private let couponService: CouponServiceType
    private var cancellables = Set<AnyCancellable>()
    
    init(couponService: CouponServiceType) {
        self.couponService = couponService
    }

    // Action 관리
    func handleAction(_ action: CouponAction) {
        switch action {
        case .download(let coupon):
            downloadCoupon(coupon)
        case .select(let coupon):
            // 선택 처리는 뷰에서 직접 처리
            break
        }
    }

    // 쿠폰 다운로드 처리
    func downloadCoupon(_ coupon: Coupon) {
        // 실제 다운로드 로직 구현 (API 호출 등) ~ 토스트 메세지만 표시
        self.downloadedCoupon = coupon
        self.toastMessage = "\(coupon.name ?? "") 쿠폰이 다운로드 되었습니다."
        self.showToast = true
        
        // 3초 후 토스트 메시지 숨기기
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showToast = false
        }
    }



    // Feature 위주 관리
    func loadCouponList() {
        let couponRequestDto = CouponRequestDTO(mcustNo: "", copnGbcd: "01", prfrYn: "N", ptcoId: nil)
        let response: AnyPublisher<CouponList, APIError> = couponService.getCouponList(urlString: "/mbo/copn/selectCopnList.nhd", parameters: couponRequestDto)
        
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
