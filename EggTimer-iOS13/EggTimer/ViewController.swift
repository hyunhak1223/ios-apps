//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    let eggTimes : [String : Int] = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var secondsPassed: Float = 0
    var totalTime: Float = 0
    
    @IBOutlet weak var barProgress: UIProgressView!
    @IBAction func hardness (_ sender: UIButton) {
        
        let hardnessss = sender.currentTitle!
        timer.invalidate()
        
        barProgress.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardnessss
        
        
        
        totalTime = Float(eggTimes[hardnessss]!)

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
       
    }
  
    
    @objc func updateTimer() {
         if secondsPassed < totalTime {
            secondsPassed += 1
            
            barProgress.progress = secondsPassed / totalTime
            
          
            
         } else {
             timer.invalidate()
             self.titleLabel.text = "DONE!"
            
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
                        
            
         }
     }
   
}
