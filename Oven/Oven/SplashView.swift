//
//  SplashView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        GeometryReader { geometry in
                    ZStack {
                        Color(red: 0.15, green: 0.15, blue: 0.15)
                            .ignoresSafeArea()
                        SplashLottieView(jsonName: "Logo")
                            .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.1)
                    } 
                }
            }
        }

struct SplashView_Previews: PreviewProvider{
    static var previews: some View {
        SplashView()
    }
}
