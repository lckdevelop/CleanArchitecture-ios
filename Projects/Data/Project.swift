//
//  Project.swift
//  CleanArchitecture-iosManifests
//
//  Created by Chaekyeong Lee on 3/30/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .module(name: "Data"),
    product: .framework,
    interfaceDependencies: [
        .domain,
        .Core.coreKit,
        .Modules.networkModule
    ]
)
