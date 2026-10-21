# 템플릿 테스트

Gemini iOS App Agent로 만든 아이폰 앱입니다.

- 코드: `App/` (SwiftUI), 프로젝트 설정: `project.yml` (XcodeGen)
- 빌드: GitHub에 푸시하면 GitHub Actions가 macOS에서 빌드해 `TemplateTest-unsigned-IPA` 아티팩트를 만듭니다.
- 설치: IPA는 서명되지 않았습니다. Sideloadly / AltStore 등으로 본인 Apple ID로 서명해 설치하세요.
