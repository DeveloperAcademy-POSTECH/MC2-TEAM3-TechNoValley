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
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                    Text(subtitle)
                }
                .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
                .frame(width: geometry.size.width, height: geometry.size.height / 5, alignment: .topLeading)
                
                Image(imageName)
                    .frame(width: geometry.size.width, alignment: .center)
            }
            .padding(.vertical)
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
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
