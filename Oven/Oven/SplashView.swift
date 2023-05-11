//
//  SplashView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        SplashLottieView(jsonName: "Logo")
            .background(Color(red: 0.15, green: 0.15, blue: 0.15))
    }
}

struct SplashView_Previews: PreviewProvider{
    static var previews: some View {
        SplashView()
    }
}
