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
                            startTimer()
                        }
                    }
                    if isMiddle {
                        xCoordinate = geometry.size.width/2
                    }
                    path.move(to: CGPoint(x: xCoordinate, y: geometry.size.height / 4))
                    path.addLine(to: CGPoint(x: xCoordinate, y: geometry.size.height * 3 / 4))
                }
                .stroke(Color.orange)
            }
            .background(
                NavigationLink(destination: TimerView(), isActive: $isShowingTimerView) {
                }
            )
        }
    }
    
    private func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isShowingTimerView = true
        }
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
