//
//  SoundsBootcamp.swift
//  UserNotification
//
//  Created by Joaquim Menezes on 20/04/24.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption:String {
        case createAccount = "tada"
        case knock = "door"
        // by default if you dont specify string..it takes the case value
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue,
                                        withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error {
            print("Error playing sound :  \(error.localizedDescription)")
        }
    }
    
    
    
}

struct SoundsBootcamp: View {
    
    
    
    var body: some View {
        VStack(spacing: 40){
            Button("Create account"){
                SoundManager.instance.playSound(sound: .createAccount)
            }
            
            Button("Knock on the door"){
                SoundManager.instance.playSound(sound: .knock)          }
        }
    }
}

#Preview {
    SoundsBootcamp()
}
