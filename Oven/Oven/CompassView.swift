//
//  CompassView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

struct CompassView: View {
    @ObservedObject var compassHeading = CompassHeading()
    @State private var randomAngle = Double.random(in: 0...360)

    var body: some View {
            Text("\(compassHeading.degrees - randomAngle)")
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
