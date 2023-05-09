//
//  InhaleView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct InhaleView: View {
    @State private var isScaled = false
    var body: some View {
        VStack {
            Spacer()
            Text(isScaled ? "내쉬세요" : "들이쉬고")
            Spacer()
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .scaleEffect(isScaled ? 2 : 1)
                .animation(.spring())
                .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
                    self.isScaled.toggle()
                }
            }
            Spacer()
        }
    }
}

struct InhaleView_Previews: PreviewProvider {
    static var previews: some View {
        InhaleView()
    }
}
