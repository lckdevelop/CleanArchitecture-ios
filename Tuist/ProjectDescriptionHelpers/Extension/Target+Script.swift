//
//  Target+Script.swift
//  ProjectDescriptionHelpers
//
//  Created by Chaekyeong Lee on 4/12/25.
//

import ProjectDescription

public extension TargetScript {
    /*
     * Project Target 설정시에 sciprt dependency에 적용해주면 됩니다.
     * Ex) scripts: [.SwiftLintString, .SwiftLintShell, .SwiftLintHook],
     */
    // 1. swiftlint 기본 제공 코드컨벤션 적용할때
    static let SwiftLintString = TargetScript.pre(script: """
        if test -d "/opt/homebrew/bin/"; then
            PATH="/opt/homebrew/bin/:${PATH}"
        fi

        export PATH

        if which swiftlint > /dev/null; then
            swiftlint
        else
            echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
        fi
        """, name: "SwiftLintString")
    
    // 2. 쉘 스크립트 실행 -> 커스텀 코드컨벤션 .yml 실행 - 컴파일시에도 코드컨벤션 실행
    static let SwiftLintShell = TargetScript.pre(
        path: .relativeToRoot("scripts/SwiftLintRunScript.sh"),
        name: "SwiftLintShell"
    )
    
    // 3. githook pre-commit시 코드컨벤션 실행
    static let SwiftLintHook = TargetScript.pre(
        path: .relativeToRoot("scripts/SwiftLintGithook.sh"),
        name: "SwiftLintHook"
    )
}
