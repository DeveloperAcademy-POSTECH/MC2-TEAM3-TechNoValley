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
    @State private var isLeft = false
    @State private var isRight = false
    @State private var isShowingTimerView = false
    
    var body: some View {
        NavigationView {
            let difference = compassHeading.degrees + randomAngle
            GeometryReader { geometry in
                ZStack {
                    VStack(spacing: geometry.size.height * 0.1) {
                        Spacer()
                        
                        Text(isMiddle ? "잘하셨어요!": "이쪽이에요")
                            .foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00))
                            .font(.custom("esamanruOTFLight", size: 21))
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.30, green: 0.30, blue: 0.30), lineWidth: 4)
                                .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                            
                            Path { path in
                                path.move(to: CGPoint(x: geometry.size.width * 0.5, y: 0))
                                path.addLine(to: CGPoint(x: geometry.size.width * 0.5, y: geometry.size.width * 0.3))
                            }
                            .stroke(Color(red: 1.00, green: 1.00, blue: 1.00))
                            .frame(height: geometry.size.width * 0.3)
                            
                            ZStack {
                                if isRight {
                                    Image(systemName: "arrowtriangle.left.fill")
                                        .foregroundColor(Color(red: 1.00, green: 0.74, blue: 0.00))
                                        .offset(x: -geometry.size.width * 0.22)
                                }
                                else if isLeft {
                                    Image(systemName: "arrowtriangle.right.fill")
                                        .foregroundColor(Color(red: 1.00, green: 0.74, blue: 0.00))
                                        .offset(x: geometry.size.width * 0.22)
                                }
                                
                                // 나침반 바늘
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
                                    
                                    if xCoordinate < geometry.size.width/2 {
                                        isLeft = true
                                        isRight = false
                                    }
                                    else if xCoordinate > geometry.size.width/2 {
                                        isRight = true
                                        isLeft = false
                                    }
                                    else {
                                        isRight = false
                                        isLeft = false
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
                                    path.move(to: CGPoint(x: xCoordinate, y: 0))
                                    path.addLine(to: CGPoint(x: xCoordinate, y: geometry.size.width * 0.3))
                                }
                                .stroke(Color(red: 1.00, green: 0.74, blue: 0.00))
                                .frame(height: geometry.size.width * 0.3)
                            }
                            .frame(height: geometry.size.width * 0.3)
                        }
                        Spacer()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                    .background(
                        NavigationLink(destination: StepView(), isActive: $isShowingTimerView) {
                        }
                    )
                    if isMiddle {
                        Text("이제 걸어볼까요?")
                            .font(.custom("esamanruOTFLight", size: 14git ))
                            .foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00))
                            .offset(y: geometry.size.height * 0.15)
                    }
                }
            }
        }
    }
    
    private func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isShowingTimerView = true
        }
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
