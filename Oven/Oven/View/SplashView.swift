//
//  SplashView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.


import SwiftUI

struct SplashView: View {
    @State private var isAnimating = true
    @State private var isActive = false // added state for NavigationLink
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true // added state for isFirstLaunching
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color(red: 0.15, green: 0.15, blue: 0.15)
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        SplashLottieView(jsonName: "Logo")
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5)
                            .offset(y : -geometry.size.height * 0.05)
                        Spacer()
                        Text("v1.0-a")
                            .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                            .font(.custom("AppleSDGothicNeo-Regular", size: 14))
                            .offset(y : -geometry.size.height * 0.05)
                        Text("Created by TechNoValley")
                            .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                            .font(.custom("AppleSDGothicNeo-Regular", size: 14))
                            .offset(y : -geometry.size.height * 0.05)
                    }
                }
            }
            .onAppear {
                // activate NavigationLink after 3 second delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    isActive = true
                    //                isFirstLaunching = false
                }
            }
            .background(
                // NavigationLink to next page
                NavigationLink(destination:
                                Group {
                                    if isFirstLaunching {
                                        OnboardingView()
                                    } else {
                                        HomeView()
                                    }
                                }, isActive: $isActive){
                                })
        }
        .navigationBarHidden(true)
    }
}

struct SplashView_Previews: PreviewProvider{
    static var previews: some View {
        SplashView()
    }
}
