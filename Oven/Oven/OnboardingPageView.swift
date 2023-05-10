//
//  OnboardingView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct OnboardingPageView: View {
    let imageName: String
    let title: String
    let subtitle: String

    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Text(subtitle)
                        .font(.title3)
                        .padding(.bottom)
                        .multilineTextAlignment(.center)
                }
                    .padding(.vertical)

                Image(imageName)
                    .frame(width: geometry.size.width / 1)
            }
                .padding(.vertical)
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(
            imageName: "note.text.badge.plus",
            title: "쓰기 탭",
            subtitle: "이 앱은 개인 메모장으로 쓸 수 있어요"
        )
    }
}
