#!/bin/sh

set -e

echo "=================================================================="
echo "tuistGenerate Script"
echo "=================================================================="

EXECUTION_DIR=${PWD}
echo "- Executed From: ${EXECUTION_DIR}"

SCRIPT_PATH=$(readlink -f "$0")
echo "- Script Path: ${SCRIPT_PATH}"

SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
echo "- Script Directory: ${SCRIPT_DIR}"

WORKSPACE_DIR="$(dirname "$(dirname "${SCRIPT_DIR}")")"
echo "- Workspace Directory: ${WORKSPACE_DIR}"

PROJECT_DIR_NAME="CleanArchitecture"
PROJECT_NAME="CleanArchitecture-ios"
PROJECT_DIR="${EXECUTION_DIR}"
echo "- Project Directory: ${PROJECT_DIR}"
echo "------------------------------------------------------------------"

# mise 활성화
if [ -n "$ZSH_VERSION" ]; then
    eval "$(~/.local/bin/mise activate zsh)"
elif [ -n "$BASH_VERSION" ]; then
    eval "$(~/.local/bin/mise activate bash)"
else
    echo "Unsupported shell. Please use bash or zsh."
    exit 1
fi

echo "\n[1] > mise install and use tuist ...\n"
mise install tuist@4.45.0
mise use tuist@4.45.0

# Tuist install 실행
echo "\n[2] > Installing Tuist ...\n"
tuist install --path "${PROJECT_DIR}"

# Tuist generate 실행 및 프로젝트 open
echo "\n[3] > Tuist build completed. Now generating project ...\n"
if [ "$1" = "--no-open" ]; then
    echo "Generating Tuist without opening the project..."
    TUIST_ROOT_DIR=$PWD tuist generate --no-open
else
    echo "Generating Tuist and opening the project..."
    TUIST_ROOT_DIR=$PWD tuist generate
fi

# Tuist 빌드
# 전체 환경 빌드 필요할때 주석 푸시오.
#echo "\n[4] > Building project with Tuist ...\n"
#TUIST_ROOT_DIR=$PWD tuist build

echo "----------------------------------"
echo "::: tuistGenerate Script Finished :::"
echo "----------------------------------\n"

