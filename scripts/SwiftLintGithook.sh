#!/bin/bash
set -e

# Homebrew 설치 경로 추가 (M1/M2 대비)
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# SwiftLint 확인
LINT=$(which swiftlint)
if [ -x "$LINT" ]; then
  echo "✅ SwiftLint found at $LINT"
else
  echo "❌ SwiftLint not installed, installing..."
  brew install swiftlint || {
    echo "❌ Brew 설치 실패! 수동으로 SwiftLint 설치 필요: https://github.com/realm/SwiftLint"
    exit 1
  }
fi

# Git hook 경로 설정
PROJECT_PATH=$(git rev-parse --show-toplevel)
HOOKS_PATH=$(git config --get core.hooksPath)

if [ "$PROJECT_PATH/.githooks" != "$HOOKS_PATH" ]; then
  echo "🔧 Git hook path 설정 중..."
  git config core.hooksPath "$PROJECT_PATH/.githooks"
  echo "✅ Git hook path 설정 완료: $PROJECT_PATH/.githooks"
else
  echo "✅ Git hook path 이미 설정되어 있음"
fi

echo "🚀 Githook setup 완료!"
