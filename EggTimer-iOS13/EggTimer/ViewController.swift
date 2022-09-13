//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var secondsRemaining = 0
    var timer = Timer()
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        timer.invalidate();
        secondsRemaining = eggTimes[sender.currentTitle!]!
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                print ("\(self.secondsRemaining) seconds")
                self.secondsRemaining = self.secondsRemaining - 1
                self.titleLabel.text = String(self.secondsRemaining)
            } else {
                Timer.invalidate()
                self.titleLabel.text = "DONE!"
            }
        }
    }
}
