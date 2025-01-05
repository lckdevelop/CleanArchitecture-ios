//
//  File.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import Foundation

extension Encodable {
    var toDictionary: [String: Any]? {
        guard let object = try? JSONEncoder().encode(self) else { return nil }
        guard let dictionary = try? JSONSerialization.jsonObject(with: object, options: []) as? [String: Any] else { return nil }
        return dictionary
    }
    
    var toDictionaryString: [String: String]? {
        guard let object = try? JSONEncoder().encode(self) else { return nil }
        guard let dictionary = try? JSONSerialization.jsonObject(with: object, options: []) as? [String: String] else { return nil }
        return dictionary
    }
}

extension Array where Element: Hashable {
    func jsonString() -> String {
        if let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) {
            return String(data: data, encoding: .utf8) ?? ""
        }
        return ""
    }
    
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

extension Array {
    func jsonString2() -> String {
        if let data = try? JSONSerialization.data(withJSONObject: self, options: []) {
            return String(data: data, encoding: .utf8) ?? ""
        }
        return ""
    }
}

extension Dictionary {
    func jsonString() -> String {
        if let data = try? JSONSerialization.data(withJSONObject: self, options: .sortedKeys) {
            return String(data: data, encoding: .utf8) ?? ""
        }
        return ""
    }
}
