// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers


let packageSettings = PackageSettings(
    productTypes: [
        "Alamofire": .framework,
        "Kingfisher": .framework,
        "Moya": .framework,
        "RxSwift": .framework,
        "RxDataSources": .framework,
        "Swinject": .framework
    ],
    baseSettings: Settings.settings(configurations: XCConfig.framework)
)
#endif


let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.1.3"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
        .package(url: "https://github.com/Moya/Moya.git", from: "15.0.3"),
        .package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", from: "5.0.2"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ]
)
