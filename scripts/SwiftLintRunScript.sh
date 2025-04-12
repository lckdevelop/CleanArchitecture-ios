#!/bin/bash

export PATH=/opt/homebrew/bin:$PATH

EXECUTION_DIR=${PWD}
echo "- Executed From: ${EXECUTION_DIR}"

SCRIPT_PATH=$(readlink "$0")
if [ -z "$SCRIPT_PATH" ]; then
  SCRIPT_PATH="$0"
fi
SCRIPT_DIR=$(cd "$(dirname "$SCRIPT_PATH")" && pwd)
echo "- Script Directory: ${SCRIPT_DIR}"

# CleanArchitecture-ios 를 workspace로 인식
WORKSPACE_DIR="$(dirname "$SCRIPT_DIR")"
echo "- Workspace Directory: ${WORKSPACE_DIR}"

SWIFTLINT_CONFIG="$WORKSPACE_DIR/.swiftlint.yml"

if [ -f "$SWIFTLINT_CONFIG" ]; then
  if which swiftlint > /dev/null; then
    cd "$WORKSPACE_DIR"
    echo "✅ Running SwiftLint with config: $SWIFTLINT_CONFIG"
    swiftlint --config "$SWIFTLINT_CONFIG"
  else
    echo '⚠️ warning: SwiftLint not installed'
  fi
else
  echo "⚠️ warning: .swiftlint.yml not found at $SWIFTLINT_CONFIG"
fi