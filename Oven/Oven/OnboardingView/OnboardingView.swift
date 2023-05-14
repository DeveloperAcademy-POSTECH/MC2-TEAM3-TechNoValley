//
//  OnboardingView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct OnboardingView: View {
    // 사용자 안내 온보딩 페이지를 앱 설치 후 최초 실행할 때만 띄우도록 하는 변수.
    // @AppStorage에 저장되어 앱 종료 후에도 유지됨.
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true

    var body: some View {
        
            ZStack {
                Color(red: 0.15, green: 0.15, blue: 0.15)
                    .ignoresSafeArea()
                // 앱 최초 구동 시 전체화면으로 OnboardingTabView 띄우기
                    .fullScreenCover(isPresented: $isFirstLaunching) {
                        OnboardingTabView(isFirstLaunching: $isFirstLaunching)
                    }
            
            .navigationBarHidden(true)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
