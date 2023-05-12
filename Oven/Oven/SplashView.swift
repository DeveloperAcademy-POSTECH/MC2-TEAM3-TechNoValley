//
//  SplashView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct SplashView: View {
    @State private var isAnimating = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 0.15, green: 0.15, blue: 0.15)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    SplashLottieView(jsonName: "Logo")
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5)
                    Spacer()
                        Text("v1.0-a")
                            .foregroundColor(.white)
                        Text("Created by TechNoValley")
                            .foregroundColor(.white)
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider{
    static var previews: some View {
        SplashView()
    }
}
