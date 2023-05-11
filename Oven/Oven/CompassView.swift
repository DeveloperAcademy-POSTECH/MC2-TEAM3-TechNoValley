//
//  CompassView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct CompassView: View {
    @ObservedObject var compassHeading = CompassHeading()
    @State private var randomAngle = Double.random(in: -360...0)
    @State private var isMiddle = false
    @State private var isShowingTimerView = false
    
    var body: some View {
        NavigationView {
            let difference = compassHeading.degrees + randomAngle
            GeometryReader { geometry in
                VStack {
                    Text("이쪽이에요")
                        .foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00))
                        .font(.custom("esamanruOTFLight", size: 40))
                    Path { path in
                        var xCoordinate = difference/360 * geometry.size.width
                        
                        switch xCoordinate {
                        case ..<0:
                            xCoordinate = xCoordinate + geometry.size.width
                        case 360...:
                            xCoordinate = xCoordinate - geometry.size.width
                        default:
                            break
                        }
                        
                        if !isMiddle {
                            if Int(xCoordinate) == Int(geometry.size.width/2) {
                                isMiddle.toggle()
                                HapticManager.instance.notification(type: .success)
                                HapticManager.instance.impact(style: .heavy)
                                startTimer()
                            }
                        }
                        if isMiddle {
                            xCoordinate = geometry.size.width/2
                        }
                        path.move(to: CGPoint(x: xCoordinate, y: geometry.size.height / 4))
                        path.addLine(to: CGPoint(x: xCoordinate, y: geometry.size.height * 3 / 4))
                    }
                    .stroke(Color(red: 1.00, green: 0.74, blue: 0.00))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                .background(
                    NavigationLink(destination: TimerView(), isActive: $isShowingTimerView) {
                    }
                )
                .onAppear {
                }
            }
        }
    }
    
    private func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isShowingTimerView = true
        }
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
