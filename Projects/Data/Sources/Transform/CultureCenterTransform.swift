//
//  CultureCenterTransform.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/17/25.
//

import Foundation
import Domain

extension ApplyCrsList {
    public func toDomain() -> CultureLecture {
        return CultureLecture.init(applyCntCal: self.applyCntCal,
                                   nickNm: self.nickNm,
                                   crsNm: self.crsNm,
                                   tuition: self.tuition,
                                   timeclassinfo: self.timeclassinfo)
    }
}
