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

    let imageName: String
    let title: String
    let subtitle: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom)
                VStack {
                    Button("위치 권한 허용하기") {
                        let locationManager = CLLocationManager()
                        locationManager.requestWhenInUseAuthorization()
                        locationManager.desiredAccuracy = kCLLocationAccuracyBest
                        locationManager.distanceFilter = kCLDistanceFilterNone
                        locationManager.startUpdatingLocation()
                        location = locationManager.location
                    }
                    .padding()
                    Text("Latitude: \(location?.coordinate.latitude ?? 0), Longitude: \(location?.coordinate.longitude ?? 0)")
                }
                Text(subtitle)
                    .font(.title2)
                    .padding(.bottom)
                Image(systemName: imageName)
                    .font(.system(size: 100))
            }
            .frame(width: geometry.size.width / 1)
            .padding(.vertical)
        }
    }
}
