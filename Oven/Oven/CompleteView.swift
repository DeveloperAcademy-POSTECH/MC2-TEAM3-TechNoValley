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
            VStack {
                Circle()
                    .fill(Color(red: 1.00, green: 0.74, blue: 0.00))
                    .frame(width: 50, height: 50)
                Text("고생하셨습니다. :-)")
                    .font(.largeTitle)
                    .padding(.bottom)
                Text("3초 후에 홈화면으로 돌아갑니다.")
                NavigationLink(destination: HomeView(), isActive: $isActive) {
                    EmptyView()
                }
            }
        }
            .navigationBarHidden(true)
            .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
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
