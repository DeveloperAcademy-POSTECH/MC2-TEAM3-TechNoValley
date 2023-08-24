//
//  OnboardingView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var isFirstLaunching: Bool

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
                
                // 페이지: 위치 권한 동의
//                OnboardingPermissionView(
//                    title: "권한을 허용해주세요.",
//                    subtitle: "도어는 휴식을 위한\n최소한의 권한만을 요구합니다."
//                )
                
                // 페이지: 온보딩 완료
                OnboardingLastPageView(
                    imageName: "check-circle",
                    title: "준비가 모두 끝났어요.",
                    subtitle: "직접 DOOR를 열어보세요.",
                    isFirstLaunching: $isFirstLaunching
                )
            }
            .tabViewStyle(PageTabViewStyle())
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}
