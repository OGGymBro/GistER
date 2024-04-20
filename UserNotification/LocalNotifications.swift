//
//  ContentView.swift
//  UserNotification
//
//  Created by Joaquim Menezes on 20/04/24.
//

import SwiftUI
import UserNotifications

class NotificationManager{
    static let instance = NotificationManager()
    
    func requestAuthorization(){
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: options) { (success, error) in
                if let error = error {
                    print("ERROR : \(error.localizedDescription)")
                }
                else {
                    print("SUCCESS")
                }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time to Wake Up!"
        content.subtitle = "Wake up now! to fix your sleep 🥱"
        content.sound = .default
        content.badge = 1
        
        //time
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 2.0,
            repeats: false)
        
        
        //calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 00
//        dateComponents.minute = 28
//        
//        let trigger = UNCalendarNotificationTrigger(
//            dateMatching: dateComponents,
//            repeats: true)
        
        //location
        
        
            
            
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
}

struct LocalNotifications: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Grant permission") {
                NotificationManager.instance.requestAuthorization()
            }
            
            Button("Get Notification") {
                NotificationManager.instance.scheduleNotification()            }
        }
        .padding()
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber = 0
            
            
        }
    }
}

#Preview {
    LocalNotifications()
}
