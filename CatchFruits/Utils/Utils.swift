//
//  Utils.swift
//  CatchFruits
//
//  Created by Apple on 17/08/2019.
//  Copyright © 2019 Bassam. All rights reserved.
//

import Foundation
import AVFoundation

class Utils {
    
    public static func playSound(_ name : String)
    {
        guard let url = Bundle.main.url(forResource:name, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
           let player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
