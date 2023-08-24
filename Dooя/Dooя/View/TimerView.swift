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
    @State private var isActive = false
    @State var timeplus2:Double = 0
    
    
    
    //타이머가 현재 5분 주기인데 1분 주기로 바꿔주기
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 40, height: 40)
                .foregroundColor(Color(hex: "252526"))
                .overlay(Text("\(timeMinutes)")
                    .font(.custom("esamanruOTFLight", size: 15))
                    .foregroundColor(.black))
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color(hex: "FFBC00"), lineWidth: 2.5)
                )
            
            
            Rectangle()
                .fill(Color(hex: "FFBC00"))//252526
                .frame(width: 38, height: 38)
                .scaleEffect(x: CGFloat(timeplus2 / 60), y: 1, anchor: .leading)
            //1분이 되면 사라지게
                .onReceive(timer) { _ in
                    if timeplus >= 300 && timeplus <= 999{
                        timer.upstream.connect().cancel() // 타이머 중지
                        
                    } else {
                        timeplus += 1
                        timeplus2 += 1
                        
                    }
                    if timeplus2 == 60 {
                        timeplus2 = 0
                    }
                }
            
                .animation(.linear(duration: 1), value: timeRemaining)
                .overlay(Text("\(timeMinutes)")
                    .foregroundColor(.white)
                    .font(.custom("esamanruOTFLight", size: 25))
                    .offset(x:0, y: 1.6)// 폰트에 따라서 글자 여백이 조금 달라서 오프셋을 줌
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        }
                        
                        if timeRemaining == 60 {
                                    isActive = true
                                }
                        //60초가 남으면 넘어가게
                        
                        switch timeRemaining {
                        case 240...300: timeMinutes = 5
                        case 180...240: timeMinutes = 4
                        case 120...180: timeMinutes = 3
                        case 61...120: timeMinutes = 2
                        case 1...60: timeMinutes = 1
                        case 0: timeMinutes = 0
                        default: timeMinutes = -1
                        }
                    }
                    .background(
                        NavigationLink(
                            destination: InhaleView(),
                            isActive: $isActive

                        ){}
                            .navigationBarHidden(true)
                    ))
            

            
            
            
            
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}




struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timeRemaining: 300)
    }
}
