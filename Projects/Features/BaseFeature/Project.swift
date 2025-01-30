//
//  Project.swift
//  CleanArchitecture-iosManifests
//
//  Created by Chaekyeong Lee on 1/30/25.
//

import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .feature(name: "Base", type: .standard),
    product: .framework,
    interfaceDependencies: [
        .domain,
        .Core.designKit
    ]
)
