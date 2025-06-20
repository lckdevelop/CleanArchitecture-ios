//
//  FeatureTarget.swift
//  CleanArchitecture-iosManifests
//
//  Created by Chaekyeong Lee on 1/29/25.
//

import Foundation

public enum FeatureType {
    case standard
    case micro
}

public enum ModuleType {
    case app
    case feature(name: String, type: FeatureType)
    case module(name: String)
    case domain(name: String)
}

