//
//  CompleteView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct CompleteView: View {
    var body: some View {
        Circle()
            .fill(Color(red: 1.00, green: 0.74, blue: 0.00))
            .frame(width: 50, height: 50)
        Text("고생하셨습니다. :-)")
            .font(.largeTitle)
            .padding(.bottom)
        Text("3초 후에 홈화면으로 돌아갑니다.")
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}
