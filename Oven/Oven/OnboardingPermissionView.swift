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
            ZStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                        Text(subtitle)
                            .padding(.bottom)
                            .fontWeight(.medium) //폰트의 두께

                        //                        .multilineTextAlignment(.center)
                    }
                        .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
                        .frame(width: geometry.size.width, height: geometry.size.height / 3, alignment: .topLeading)
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
                    VStack {
                        Text("만약 권한을 거부하신 경우, 시스템 설정에서 직접 권한을 허용해주셔야 합니다.")
                            .fontWeight(.thin)
                    }
                        .padding(EdgeInsets(top: 200, leading: 40, bottom: 0, trailing: 40))
                }
                    .padding(.vertical)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            }
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
