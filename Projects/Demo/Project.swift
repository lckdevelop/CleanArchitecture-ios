//
//  Project.swift
//  AppModuleManifests
//
//  Created by Chaekyeong Lee on 2/2/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .feature(name: "\(Environment.workspaceName)-Demo", type: .standard),
    product: .framework,
    interfaceDependencies: [
        .data,
        .Features.Root.Feature
    ]
)
