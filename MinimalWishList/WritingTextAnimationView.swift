import SwiftUI

struct WritingTextAnimationView: View {
    let text = "Hello, World!" // 표시할 텍스트
    @State private var animatedText = "" // 애니메이션 효과로 하나씩 추가될 텍스트
    @State private var currentIndex = 0 // 현재까지 표시된 텍스트의 인덱스
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect() // 애니메이션 효과를 위한 타이머

    var body: some View {
        Text(animatedText)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.blue)
            .onReceive(timer) { _ in
                guard currentIndex < text.count else { return } // 모든 텍스트를 표시했다면 타이머 중지
                let index = text.index(text.startIndex, offsetBy: currentIndex)
                animatedText += String(text[index]) // 텍스트 추가
                currentIndex += 1
            }
    }
}

struct WritingTextAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        WritingTextAnimationView()
    }
}
