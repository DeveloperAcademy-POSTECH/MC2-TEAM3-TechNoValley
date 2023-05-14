//
//  OnboardingTabAgainView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/14.
//

import SwiftUI

struct OnboardingTabAgainView: View {

    var body: some View {
        ZStack {
            Color(red: 0.15, green: 0.15, blue: 0.15)
                .ignoresSafeArea()
            TabView {
                // 페이지
                OnboardingPageView(
                    imageName: "guide-sample",
                    title: "열정적인 그대에게",
                    subtitle: "도어는 일상 속 작은 휴식을 선물합니다."
                )
                
                // 페이지
                OnboardingPageView(
                    imageName: "guide-sample",
                    title: "도어는 간단해요.",
                    subtitle: "버튼만 누르면 오분 타이머가 시작돼요."
                )
                
                // 페이지
                OnboardingPageView(
                    imageName: "guide-sample",
                    title: "시선을 돌려봐요.",
                    subtitle: "선을 화면 중앙에 맞춰 작은 여정을 시작해요."
                )
                
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
    struct OnboardingTabAgainView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingTabAgainView()
        }
    }

}
