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
                // 페이지 1
                OnboardingPageView(
                    imageName: "person.3.fill",
                    title: "환영합니다.",
                    subtitle: "Ov5n은 언제나 열정적인 당신을 위해\n일상 속 작은 휴식을 선물합니다. "
                )

                // 페이지 2
                OnboardingPageView(
                    imageName: "note.text.badge.plus",
                    title: "온보딩2",
                    subtitle: "온보딩2 화면이에요."
                )

                // 페이지 3
                OnboardingPermissionView(
                    imageName: "face.smiling.inverse",
                    title: "위치 권한 동의",
                    subtitle: "식히기 위해 위치 권한 동의가 필요합니다."
                )

                // 페이지 4: 온보딩 완료
                OnboardingLastPageView(
                    imageName: "eyes",
                    title: "온보딩4",
                    subtitle: "온보딩4 화면이에요.",
                    isFirstLaunching: $isFirstLaunching
                )
            }
                .tabViewStyle(PageTabViewStyle())
    }
}
