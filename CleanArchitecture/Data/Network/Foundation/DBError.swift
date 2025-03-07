//
//  DBError.swift
//  CleanArchitecture
//
//  Created by 김서진 on 1/19/25.
//

import Foundation

enum DBError: Error {
    case error(Error)
    case emptyValue
    case invalidatedType
}
