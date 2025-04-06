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
#PROJECT_DIR="${WORKSPACE_DIR}/${PROJECT_DIR_NAME}/${PROJECT_NAME}"
PROJECT_DIR="${EXECUTION_DIR}"
echo "- Project Directory: ${PROJECT_DIR}"
echo "------------------------------------------------------------------"

echo "\n[1] > mise install and use tuist ...\n"
mise install tuist
mise use tuist@4.45.0

# Tuist install 실행
echo "\n[2] > Installing Tuist ...\n"
tuist install --path "${PROJECT_DIR}"

# Tuist generate 실행 및 프로젝트 open
if [ "$1" = "--no-open" ]; then
    echo "Generating Tuist without opening the project..."
    TUIST_ROOT_DIR=$PWD tuist generate --no-open
else
    echo "Generating Tuist and opening the project..."
    TUIST_ROOT_DIR=$PWD tuist generate
fi

echo "----------------------------------"
echo "::: tuistGenerate Script Finished :::"
echo "----------------------------------\n"
