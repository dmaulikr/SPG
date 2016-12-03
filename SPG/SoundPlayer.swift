//
//  SoundPlayer.swift
//  SPG
//
//  Created by Student on 2016-12-02.
//  Copyright © 2016 WestNet. All rights reserved.
//

import Foundation
import AVFoundation

class SoundPlayer
{
    static let sharedHelper = SoundPlayer()
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "GameMusicSound", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
    
    func playhit() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "hit", ofType: "wav")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
}
