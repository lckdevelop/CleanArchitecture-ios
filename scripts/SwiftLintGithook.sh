# SwiftLint 경로 설정
LINT=$(which swiftlint)

if [ -x "$LINT" ]; then
  echo "✅ SwiftLint found at $LINT"
else
  echo "❌ SwiftLint not installed, download from https://github.com/realm/SwiftLint"
  exit 1
fi

# Git hook path 설정
PROJECT_PATH=$(pwd)
HOOKS_PATH=$(git config --get core.hooksPath)
if [ "$PROJECT_PATH/.githooks" != "$HOOKS_PATH" ]; then
  git config core.hooksPath "$PROJECT_PATH/.githooks"
fi

# 실행
"$LINT"
