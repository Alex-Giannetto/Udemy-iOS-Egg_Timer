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
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes: [String : Int] = ["Soft": 5, "Medium": 8, "Hard": 12]
    var totalTime = 0
    var secondePassed = 0
    
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        totalTime = eggTimes[sender.currentTitle!]!
        timer.invalidate()
        progressBar.progress = 0
        secondePassed = 0
        titleLabel.text = sender.currentTitle!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil,repeats: true)
    }
    
    @objc func updateTimer(){
        if secondePassed < totalTime{
            secondePassed += 1
            progressBar.progress = Float(secondePassed) / Float(totalTime)
        }
        
        if secondePassed >= totalTime{
            timer.invalidate()
            titleLabel.text = "Done !"
        }
    }
    
}
