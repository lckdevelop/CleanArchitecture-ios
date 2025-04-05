//
//  Injected.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 4/2/25.
//

import Foundation

@propertyWrapper
public class Injected<T> {
    public let wrappedValue: T
    
    public init() {
        self.wrappedValue = DIContainer.shared.resolve(T.self)!
    }
}
