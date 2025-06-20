echo "SwiftLint 설치 여부 확인 중..."

if ! command -v swiftlint &> /dev/null; then
  echo "SwiftLint가 설치되어 있지 않습니다. 설치를 시작합니다..."
  if ! command -v brew &> /dev/null; then
    echo "Homebrew가 설치되어 있지 않아 SwiftLint 설치가 불가능합니다. 먼저 Homebrew를 설치해주세요: https://brew.sh"
    exit 1
  fi
  brew install swiftlint
  echo "SwiftLint 설치 완료!"
else
  echo "SwiftLint가 이미 설치되어 있습니다."
fi

echo "SwiftLint pre-commit hook 설정 중..."

# .githooks 디렉토리를 Git hook 디렉토리로 설정
git config core.hooksPath .githooks

# 실행 권한 추가
chmod +x scripts/SwiftLintGithook.sh

# 실행 권한 부여
chmod +x .githooks/pre-commit

echo ".githooks/pre-commit 설정이 완료되었습니다!"
