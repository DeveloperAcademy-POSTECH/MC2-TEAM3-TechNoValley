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
            TabView {
                // 페이지
                OnboardingPageView(
                    imageName: "guide-sample",
                    title: "열정적인 그대에게",
                    subtitle: "오분은 일상 속의\n작은 휴식을 선물합니다."
                )

                // 페이지
                OnboardingPageView(
                    imageName: "guide-sample",
                    title: "오분은 간단해요.",
                    subtitle: "버튼만 누르면\n오분 타이머가 시작되어요."
                )
                
                // 페이지
                OnboardingPageView(
                    imageName: "guide-sample",
                    title: "시선을 돌려봐요.",
                    subtitle: "선을 중앙에 맞춰\n작은 여정을 시작해봐요."
                )

                // 페이지: 위치 권한 동의
                OnboardingPermissionView(
                    title: "권한을 허용해주세요.",
                    subtitle: "오분은 휴식을 위한\n필수적인 권한만을 요구합니다."
                )

                // 페이지: 온보딩 완료
                OnboardingLastPageView(
//                    imageName: "guide-sample",
                    title: "준비가 끝났어요.",
                    subtitle: "오분의 여정을 시작해봐요.",
                    isFirstLaunching: $isFirstLaunching
                )
            }
                .tabViewStyle(PageTabViewStyle())
    }
}