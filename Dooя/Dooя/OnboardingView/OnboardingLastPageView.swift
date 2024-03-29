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
            ZStack {
                VStack {
                    Spacer()
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 45, trailing: 0))

                    VStack {
                        Text(title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .foregroundColor(.white)
                        Text(subtitle)
                            .padding(.bottom)
                            .fontWeight(.medium) //폰트의 두께
                            .foregroundColor(.white)

                    }
                    Spacer()
                    //                 온보딩 완료 버튼.
                    //                 AppStorage의 isFirstLaunching 값을 false로 바꾸기 때문에, 다음번에 앱을 실행할 때는 OnboardingTabView를 띄우지 않음.
                    Button {
                        isFirstLaunching.toggle()
                    } label: {
                        Text("DOOR 시작하기")
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
                            .frame(width: 300, height: 50)
                            .background(Color(red: 1.00, green: 0.74, blue: 0.00))
                            .cornerRadius(25)
                    }
                        .frame(width: geometry.size.width)
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 100, trailing: 0))
                }
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}
