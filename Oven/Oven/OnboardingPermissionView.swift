//
//  OnboardingView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI
import CoreLocation
import CoreMotion

struct OnboardingPermissionView: View {
    @State private var location: CLLocation?
    @State private var motionManager = MotionManager()

    let title: String
    let subtitle: String

    var body: some View {
        let locationManager = CLLocationManager()
        
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Text(subtitle)
                        .font(.title2)
                        .padding(.bottom)
                        .multilineTextAlignment(.center)
                }
                    .padding(.vertical)
                VStack {
                    Button {
                        locationManager.requestWhenInUseAuthorization()
                    } label: {
                        Text("위치 권한 허용하기")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color(red: 1.00, green: 0.55, blue: 0.00))
                            .cornerRadius(6)
                    }
                }
                    .frame(width: geometry.size.width)
                    .padding(.bottom)
                VStack {
                    Button {
                        motionManager.requestMotionPermission()
                    } label: {
                        Text("모션 권한 허용하기")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color(red: 1.00, green: 0.55, blue: 0.00))
                            .cornerRadius(6)
                    }
                }
                    .frame(width: geometry.size.width)
                    .padding(.bottom)
            }
                .padding(.vertical)
        }
    }
}

class MotionManager {
    let motionManager = CMMotionActivityManager()
    let queue = OperationQueue()
    
    func requestMotionPermission() {
        motionManager.startActivityUpdates(to: queue) { (activity) in
            // do nothing
        }
    }
}
