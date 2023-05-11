//
//  InhaleView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct InhaleView: View {
    @State private var isActive: Bool = false
    @State private var isScaled = false
    let texts = ["숨을 천천히 들이쉬고", "내쉬어 보세요.", "숨을 천천히 들이쉬고", "내쉬어 보세요.", "", "", "시원한 공기가\n몸 속으로 들어오고 있나요?", "의식하며 호흡을 하는 것이 중요해요.", "", "", "", "", "산책은 스트레스를 해소하는데\n도움이 된다고 해요.", "매일 산책하는 습관을 들여보세요.", "", "", "", "", "크게 호흡하는 것도\n잊지 말고요!", "이번 휴식으로 마음이\n조금은 편해졌기를 바라요.", "이번 휴식으로 마음이\n조금은 편해졌기를 바라요."]
    @State private var currentText = 0

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    ZStack {
                        Circle()
                            .strokeBorder(Color(red: 1.00, green: 0.74, blue: 0.00), lineWidth: isScaled ? 4 : 2)
                            .frame(width: 100, height: 100)
                            .scaleEffect(isScaled ? 1 : 2)
                            .animation(.spring(response: 1.5, dampingFraction: 0.45, blendDuration: 0.2))
                            .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 2.9, repeats: true) { _ in
                                self.isScaled.toggle()
                            }
                        }
                    }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 150, trailing: 0))
                    ZStack (alignment: .center) {
                        Text(texts[currentText])
                            .font(.title3)
                            .multilineTextAlignment(.center)
                    }
                        .lineSpacing(8)
                        .padding(EdgeInsets(top: 200, leading: 0, bottom: 0, trailing: 0))
                        .onReceive(Timer.publish(every: 2.89, on: .main, in: .common).autoconnect()) { _ in
                        if self.currentText == self.texts.count - 1 {
                            self.currentText = 0
                        } else {
                            self.currentText += 1
                        }
                    }
                    NavigationLink(destination: CompleteView(), isActive: $isActive) {
                        EmptyView()
                    }
                }
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
            .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 60.0) {
                isActive = true
            }
        }
    }
}

struct InhaleView_Previews: PreviewProvider {
    static var previews: some View {
        InhaleView()
    }
}
