//
//  Project.swift
//  CleanArchitecture-iosManifests
//
//  Created by Chaekyeong Lee on 1/29/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .module(name: "ThirdPartyLibrary"),
    product: .framework,
    interfaceDependencies: [
        .Library.moya,
        .Library.alamofire,
        .Library.rxSwift,
        .Library.rxDataSources,
        .Library.kingfisher
    ]
)
