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
    moduleType: .feature(name: "Coupon", type: .standard),
    product: .framework,
    interfaceDependencies: [
        .Features.BaseFeature
    ]
)
