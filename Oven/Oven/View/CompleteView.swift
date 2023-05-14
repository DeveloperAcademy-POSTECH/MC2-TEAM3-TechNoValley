//
//  CompleteView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct CompleteView: View {
    @State private var isActive: Bool = false

    var body: some View {

        NavigationView {
            ZStack {
                Color(hex: "252526")
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Spacer()
                 
                    Text("고생하셨습니다. :-)")
                        .font(.custom("esamanruOTFLight", size: 26))
                        .foregroundColor(.white)
                        
                    Circle()
                        .fill(Color(red: 1.00, green: 0.74, blue: 0.00))
                        .frame(width: 55, height: 55)
                        .padding(40)
     
                    Text("3초 후에 홈화면으로 돌아갑니다.")
                        .padding(.top)
                        .font(.custom("esamanruOTFLight", size: 13))
                        .foregroundColor(.white)
                    Spacer()
                    Spacer()
                    Spacer()
                    NavigationLink(destination: HomeView(), isActive: $isActive) {
                        
                    }
                }
            }
            
        }
            .navigationBarHidden(true)
            .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 300.0) {
                isActive = true
            }
        }
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}
