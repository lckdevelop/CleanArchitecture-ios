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
        .Library.rxSwift,
        .Library.rxDataSources,
        .Library.kingfisher,
        .Library.swinject
//        .package(product: "RxSwift"),
//        .package(product: "RxCocoa"),
//        .package(product: "RxRelay"),
//        .package(product: "RxCocoaRuntime"), // 추가
//        .package(product: "Moya"),
//        .package(product: "RxDataSources"),
//        .package(product: "Kingfisher"),
//        .package(product: "Swinject")
    ]
)
