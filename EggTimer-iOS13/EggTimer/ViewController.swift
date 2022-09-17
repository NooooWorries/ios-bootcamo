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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalSeconds = 0
    var secondsRemaining = 0
    var timer = Timer()
    var player: AVAudioPlayer?
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        timer.invalidate();
        totalSeconds = eggTimes[sender.currentTitle!]!
        secondsRemaining = totalSeconds
        progressBar.progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            (Timer) in
            if self.secondsRemaining > 0 {
                self.secondsRemaining = self.secondsRemaining - 1
                self.progressBar.progress = Float(self.totalSeconds - self.secondsRemaining) / Float(self.totalSeconds)
                self.titleLabel.text = String(self.secondsRemaining)
            } else {
                self.progressBar.progress = 1.0
                Timer.invalidate()
                self.titleLabel.text = "DONE!"
                self.playSound(fileName: "alarm_sound")
            }
        }
    }
    
    func playSound(fileName: String?) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "mp3") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("There is an issue with this code!")
        }
    }
}
