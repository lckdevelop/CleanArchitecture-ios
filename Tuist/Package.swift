// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers


let packageSettings = PackageSettings(
    productTypes: [
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
    name: "ThirdPartyLibrary",
    platforms: [.iOS(.v15)],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "8.1.3")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.5.0")),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMinor(from: "15.0.3")),
        .package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", .upToNextMajor(from: "5.0.2")),
        .package(url: "https://github.com/Swinject/Swinject.git", .upToNextMajor(from: "2.9.1"))
    ]
)
