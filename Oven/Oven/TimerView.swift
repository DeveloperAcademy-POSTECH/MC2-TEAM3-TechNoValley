//
//  TimerView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI


struct TimerView: View {
    @State var timeRemaining: Double = 300
    @State var timeMinutes = 5
    @State var timeplus:Double = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .frame(width: 100, height: 100)
                .border(Color.red, width: 2)
                .foregroundColor(.white)
                .overlay(Text("\(timeMinutes)")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                         
                )
            
            
            Rectangle()
                .frame(width: 100, height: 100)
            
                .scaleEffect(x: CGFloat(timeplus / 300), y: 1, anchor: .leading)
                .onReceive(timer) { _ in
                    timeplus += 1
                }
            
                .animation(.linear(duration: 1), value: timeRemaining)
                .overlay(Text("\(timeMinutes)")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        }
                        switch timeRemaining {
                        case 240...300: timeMinutes = 5
                        case 180...240: timeMinutes = 4
                        case 120...180: timeMinutes = 3
                        case 61...120: timeMinutes = 2
                        case 1...60: timeMinutes = 1
                        case 0: timeMinutes = 0
                        default: timeMinutes = -1
                        }
                    })
            

            
            
            
            
        }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
