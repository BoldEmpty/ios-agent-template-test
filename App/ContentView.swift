import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "iphone")
                    .font(.system(size: 64))
                    .foregroundStyle(.tint)
                Text("템플릿 테스트")
                    .font(.largeTitle.bold())
                Text("Gemini iOS App Agent로 만든 앱")
                    .foregroundStyle(.secondary)
            }
            .padding()
            .navigationTitle("홈")
        }
    }
}

#Preview {
    ContentView()
}
