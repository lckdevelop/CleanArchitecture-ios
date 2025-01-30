//
//  Project.swift
//  CleanArchitecture-iosManifests
//
//  Created by Chaekyeong Lee on 1/29/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .app,
    product: .app,
    interfaceDependencies: [
        .data,
        .domain,
        .core,
        .Features.RootFeature
    ]
)
