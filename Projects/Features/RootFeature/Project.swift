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
    moduleType: .feature(name: "RootFeature", type: .standard),
    product: .framework,
    internalDependencies: [
        .Features.Main.Feature,
        .Features.CultureCenter.Feature,
        .Features.Coupon.Feature
    ]
)
