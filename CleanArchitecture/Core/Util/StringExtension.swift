//
//  StringExtension.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import Foundation

extension String {
    var numberWithCommaFormat: String {
        guard let number = Double(self) else { return "0" }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        
        return formatter.string(from: NSNumber(value: number)) ?? "0" // 변환 실패 시 "0" 반환

    }
    
    func jsonData() -> Any? {
        let object = try? JSONSerialization.jsonObject(with: self.data(using: .utf8)!, options: [])
        return object
    }
}
