//
//  HapticsBootcamp.swift
//  UserNotification
//
//  Created by Joaquim Menezes on 20/04/24.
//

import SwiftUI

class HapticManager {
    
    static let instance = HapticManager()
    
    func notification(type :UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style :UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
        
    }
    
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing :20){
            Button("Success"){
                HapticManager.instance.notification(type: .success)
            }
            .foregroundStyle(.green)
            
            Button("Warning"){
                HapticManager.instance.notification(type: .warning)
            }
            .foregroundStyle(.yellow)
            
            Button("Error"){
                HapticManager.instance.notification(type: .error)
            }
            .foregroundStyle(.red)
            Divider()
            
            Button("soft"){
                HapticManager.instance.impact(style: .soft)
            }
            .foregroundStyle(.primary)
            
            Button("light"){
                HapticManager.instance.impact(style: .light)
            }
            .foregroundStyle(.primary)
            
            Button("medium"){
                HapticManager.instance.impact(style: .medium)
            }
            .foregroundStyle(.primary)
            
            Button("heavy"){
                HapticManager.instance.impact(style: .heavy)
            }
            .foregroundStyle(.primary)
            
            Button("rigid"){
                HapticManager.instance.impact(style: .rigid)
            }
            .foregroundStyle(.primary)
            
        }
    }
}

#Preview {
    HapticsBootcamp()
}
