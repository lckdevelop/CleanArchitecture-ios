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
    moduleType: .feature(name: "Root", type: .standard),
    product: .framework,
    dependencies: [
        .Features.Main.Feature
    ]
)
