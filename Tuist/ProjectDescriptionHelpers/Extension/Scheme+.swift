//
//  Scheme+.swift
//  ProjectDescriptionHelpers
//
//  Created by Chaekyeong Lee on 1/29/25.
//

import ProjectDescription

extension Scheme {
    static func configureAppScheme(
        schemeName: String
    ) -> [Scheme] {
        let developmentConfiguration: ConfigurationName = .configuration("Development")
        let stagingConfiguration: ConfigurationName = .configuration("Staging")
        let releaseConfiguration: ConfigurationName = .configuration("Release")
        
        let buildAction = BuildAction.buildAction(targets: [TargetReference(stringLiteral: schemeName)])
        
        return [
            Scheme.scheme(
                name: schemeName + "-Development",
                shared: true,
                buildAction: buildAction,
                runAction: .runAction(configuration: developmentConfiguration),
                archiveAction: .archiveAction(configuration: developmentConfiguration),
                profileAction: .profileAction(configuration: developmentConfiguration),
                analyzeAction: .analyzeAction(configuration: developmentConfiguration)
            ),
            Scheme.scheme(
                name: schemeName + "-Staging",
                shared: true,
                buildAction: buildAction,
                runAction: .runAction(configuration: stagingConfiguration),
                archiveAction: .archiveAction(configuration: stagingConfiguration),
                profileAction: .profileAction(configuration: stagingConfiguration),
                analyzeAction: .analyzeAction(configuration: stagingConfiguration)
            ),
            Scheme.scheme(
                name: schemeName + "-Release",
                shared: true,
                buildAction: buildAction,
                runAction: .runAction(configuration: releaseConfiguration),
                archiveAction: .archiveAction(configuration: releaseConfiguration),
                profileAction: .profileAction(configuration: releaseConfiguration),
                analyzeAction: .analyzeAction(configuration: releaseConfiguration)
            )
        ]
    }
    
    static func configureDemoAppScheme(
        schemeName: String
    ) -> Scheme {
        let developmentConfiguration: ConfigurationName = .configuration("Development")
        
        let buildAction = BuildAction.buildAction(targets: [TargetReference(stringLiteral: schemeName)])
        
        return Scheme.scheme(
            name: schemeName,
            shared: true,
            buildAction: buildAction,
            runAction: .runAction(configuration: developmentConfiguration),
            archiveAction: .archiveAction(configuration: developmentConfiguration),
            profileAction: .profileAction(configuration: developmentConfiguration),
            analyzeAction: .analyzeAction(configuration: developmentConfiguration)
        )
    }
    
    static func configureScheme(
        schemeName: String
    ) -> Scheme {
        let configuration: ConfigurationName = .configuration("Development")
        
        let buildAction = BuildAction.buildAction(targets: [TargetReference(stringLiteral: schemeName)])
        
        return Scheme.scheme(
                name: schemeName,
                shared: true,
                buildAction: buildAction,
                runAction: .runAction(configuration: configuration),
                archiveAction: .archiveAction(configuration: configuration),
                profileAction: .profileAction(configuration: configuration),
                analyzeAction: .analyzeAction(configuration: configuration)
        )
    }
}

