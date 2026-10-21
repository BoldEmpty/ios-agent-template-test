#!/bin/bash
# 서명 없는 IPA 빌드: build/TemplateTest-unsigned.ipa (macOS + Xcode + XcodeGen 필요 → GitHub Actions에서 실행)
set -euo pipefail
cd "$(dirname "$0")"
command -v xcodebuild >/dev/null || { echo 'macOS + Xcode required'; exit 1; }
command -v xcodegen >/dev/null || { echo 'Install XcodeGen: brew install xcodegen'; exit 1; }
mkdir -p build
echo "[PROGRESS] 10"
xcodegen generate
echo "[PROGRESS] 25"
xcodebuild -project TemplateTest.xcodeproj -scheme TemplateTest -configuration Release -sdk iphoneos \
  -destination 'generic/platform=iOS' -derivedDataPath build/DerivedData CODE_SIGNING_ALLOWED=NO build
echo "[PROGRESS] 85"
rm -rf build/Payload
mkdir -p build/Payload
cp -R build/DerivedData/Build/Products/Release-iphoneos/TemplateTest.app build/Payload/
codesign --force --sign - build/Payload/TemplateTest.app
(cd build && rm -f TemplateTest-unsigned.ipa && zip -qry TemplateTest-unsigned.ipa Payload)
echo "[PROGRESS] 100"
echo 'Created build/TemplateTest-unsigned.ipa — sign it with your Apple ID (Sideloadly/AltStore) before installing.'
