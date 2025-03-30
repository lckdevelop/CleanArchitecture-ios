//
//  Project.swift
//  CleanArchitecture-iosManifests
//
//  Created by Chaekyeong Lee on 3/30/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .domain(name: "Domain"),
    product: .framework,
    interfaceDependencies: [
        //.Modules.shared,
        .Core.coreKit
    ]
)
