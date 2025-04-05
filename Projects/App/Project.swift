//
//  Project.swift
//  CleanArchitecture-iosManifests
//
//  Created by Chaekyeong Lee on 3/30/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .app,
    product: .app,
    interfaceDependencies: [
        .Features.RootFeature,
        .data,
        .Modules.data
    ]
)
