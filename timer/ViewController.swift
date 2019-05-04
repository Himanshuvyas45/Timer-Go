//
//  ViewController.swift
//  timer
//
//  Created by admin on 04/05/19.
//  Copyright © 2019 professional. All rights reserved.
//

import UIKit
import Lottie
class ViewController: UIViewController {

    @IBOutlet private var animationView: LOTAnimationView!
    
    @IBOutlet weak var timeLable: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    
var time = 0
    var timer = Timer()
    var buttonState =  true



    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
        timeLable.text = "00"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        if buttonState {
            playButton.setTitle("pause", for: .normal)
            
            buttonState = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.addToTime), userInfo: nil, repeats: true)
            
        } else {
            playButton.setTitle("start", for: .normal)
            buttonState = true
            timer.invalidate()
            
        }
        
    }
    
    
    @IBAction func stopTapped(_ sender: Any) {
        timer.invalidate()
        time = 0
        timeLable.text = "00"
    }
    
    
    
    @IBAction func resettapped(_ sender: Any) {
        
    }
    @objc func addToTime(){
        time = time + 1
        timeLable.text = "\(time)"
    }
    
    func startAnimation(){
        animationView.setAnimation(named: "3703-alarm-clock")
        animationView.loopAnimation = true
        animationView.play()
    }
}

