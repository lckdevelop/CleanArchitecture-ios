//
//  DIContainer.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/18/25.
//

import Foundation
import Swinject


public final class DIContainer: ObservableObject {
    public static let shared = DIContainer()
    public let container: Container

    private init() {
        container = Container()
    }

    public func resolve<T>(_ type: T.Type) -> T? {
        container.resolve(T.self)
    }
}
