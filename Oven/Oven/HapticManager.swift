//
//  HapticManager.swift
//  Oven
//
//  Created by 금가경 on 2023/05/09.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    func notification(type : UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style : UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
