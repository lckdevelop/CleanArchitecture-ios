//
//  Project.swift
//  CleanArchitecture-iosManifests
//
//  Created by Chaekyeong Lee on 1/29/25.
//

import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .feature(name: "CultureCenter", type: .micro),
    product: .framework,
    interfaceDependencies: [
        .Features.BaseFeature
    ]
)
