//
//  SplashView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        LottieView(jsonName: "Logo")
            .frame(width:300, height:300)
    }
}

struct SplashView_Previews: PreviewProvider{
    static var previews: some View {
        SplashView()
    }
}
