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
    
    var body: some View {
        let difference = compassHeading.degrees + randomAngle
        GeometryReader { geometry in
            let xCoordinate = difference/360 * geometry.size.width
            
            Path { path in
                let x: CGFloat
                switch xCoordinate {
                case ..<0:
                    x = xCoordinate + geometry.size.width
                case 360...:
                    x = xCoordinate - geometry.size.width
                default:
                    x = xCoordinate
                }
                path.move(to: CGPoint(x: x, y: geometry.size.height / 4))
                path.addLine(to: CGPoint(x: x, y: geometry.size.height * 3 / 4))
            }
            .stroke(Color.orange)
        }
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
