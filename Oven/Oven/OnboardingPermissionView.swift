//
//  OnboardingView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI
import CoreLocation

struct OnboardingPermissionView: View {
    @State private var location: CLLocation?

    let title: String
    let subtitle: String

    var body: some View {
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
                        let locationManager = CLLocationManager()
                        locationManager.requestWhenInUseAuthorization()
                        locationManager.desiredAccuracy = kCLLocationAccuracyBest
                        locationManager.distanceFilter = kCLDistanceFilterNone
                        locationManager.startUpdatingLocation()
                        location = locationManager.location
                    } label: {
                        Text("위치 권한 허용하기")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color(red: 1.00, green: 0.55, blue: 0.00))
                            .cornerRadius(6)
                    }
                }
                    .frame(width: geometry.size.width / 1)
                    .padding(.bottom)
            }
                .padding(.vertical)
        }
    }
}
