//
//  OnboardingView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct OnboardingLastPageView: View {
    let imageName: String
    let title: String
    let subtitle: String

    @Binding var isFirstLaunching: Bool

    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()

                    Text(subtitle)
                        .font(.title2)
                }
                    .padding(.vertical)
                Image(imageName)
                    .padding()
//                 온보딩 완료 버튼.
//                 AppStorage의 isFirstLaunching 값을 false로 바꾸기 때문에, 다음번에 앱을 실행할 때는 OnboardingTabView를 띄우지 않음.
                Spacer()
                Button {
                    isFirstLaunching.toggle()
                } label: {
                    Text("OVEN 시작하기")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color(red: 1.00, green: 0.55, blue: 0.00))
                        .cornerRadius(6)
                }
                    .frame(width: geometry.size.width)
                    .padding(.vertical)
                Spacer()
            }
        }
    }
}
