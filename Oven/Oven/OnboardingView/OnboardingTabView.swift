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
                
                // 페이지: 위치 권한 동의
//                OnboardingPermissionView(
//                    title: "권한을 허용해주세요.",
//                    subtitle: "도어는 휴식을 위한\n최소한의 권한만을 요구합니다."
//                )
                
                // 페이지: 온보딩 완료
                OnboardingLastPageView(
                    imageName: "check-circle",
                    title: "준비가 모두 끝났어요.",
                    subtitle: "바로 오분 간의 여정을 시작해보세요.",
                    isFirstLaunching: $isFirstLaunching
                )
            }
            .tabViewStyle(PageTabViewStyle())
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}
