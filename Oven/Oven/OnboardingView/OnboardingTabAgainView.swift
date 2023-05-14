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
                    imageName: "onboarding01",
                    title: "도어는 간단해요.",
                    subtitle: "슬라이드를 밀어 도어를 시작해보세요."
                )
                
                // 페이지
                OnboardingPageView(
                    imageName: "onboarding02",
                    title: "시선을 돌려봐요.",
                    subtitle: "도어가 휴식의 방향을 제안합니다."
                )
                
                // 페이지
                OnboardingPageView(
                    imageName: "onboarding03",
                    title: "자유롭게 걸어보세요.",
                    subtitle: "도어를 연 동안엔 망설일 필요 없어요."
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
