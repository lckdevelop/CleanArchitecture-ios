// miseBootstrap.sh

set -e

echo "=================================================================="
echo "miseBootstrap Script"
echo "=================================================================="

#...
#해당 부분에 다양한 tool 설치 및 환경 설정 명령어가 존재합니다.
#...

# mise 설치
if ! command -v mise &> /dev/null; then
  echo "\n[7] > Installing mise ...\n"
  curl https://mise.run | sh
else
  echo "mise is already installed."
fi

# mise 활성화
echo "\n[8] > Activating mise ...\n"
if ! grep -q 'eval "$(~/.local/bin/mise activate zsh)"' ~/.zshrc; then
  echo 'eval "$(~/.local/bin/mise activate zsh)"' >> ~/.zshrc
else
  echo "mise is already activated in ~/.zshrc"
fi

echo "\n---------------------------------"
echo "::: Bootstrap Script Finished :::"
echo "---------------------------------\n"
