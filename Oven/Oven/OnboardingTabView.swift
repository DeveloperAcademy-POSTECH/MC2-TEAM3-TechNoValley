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
                    title: "온보딩1",
                    subtitle: "온보딩1 화면이에요."
                )

                // 페이지 2
                OnboardingPageView(
                    imageName: "note.text.badge.plus",
                    title: "온보딩2",
                    subtitle: "온보딩2 화면이에요."
                )

                // 페이지 3
                OnboardingPageView(
                    imageName: "face.smiling.inverse",
                    title: "온보딩3",
                    subtitle: "온보딩3 화면이에요."
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
