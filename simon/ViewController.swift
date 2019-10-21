//
//  ViewController.swift
//  simon
//
//  Created by Kent Koehler on 9/20/19.
//  Copyright © 2019 Kent Koehler. All rights reserved.
//

import UIKit

class CustomTimerInfo { // timer info class
    var end = 10
    var loop = 1
    var rand = Int.random(in: 0...3)
    
    func setRand() {
        self.rand = Int.random(in: 0...3)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    let info = CustomTimerInfo()
    
    // bright image colors for blinking -- not sure if works fingers crossed
    let brightBtnPics: [UIImage] = [UIImage(named: "brightRed")!, UIImage(named: "brightGreen")!, UIImage(named: "brightBlue")!, UIImage(named: "brightYellow")!]
    let regBtnPics: [UIImage] = [UIImage(named: "red")!, UIImage(named: "green")!, UIImage(named: "blue")!, UIImage(named: "yellow")!]
    var currColors = 4 // current amount of colors to remember
    var btns: [UIButton] = [] // future list of btns but cant create here
    var guesses: [Int] = [] // guesses for order
    var order: [Int] = [] // order of colors
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btns = [redBtn, greenBtn, blueBtn, yellowBtn] // red 0, green 1, blue 2, yellow 3
    }

    @IBAction func start(_ sender: Any) {
        self.startBtn.isEnabled = false // disable button on button press
        for btn in self.btns {
            btn.isEnabled = false // disable guess btns so no problems
        }
        let _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeBtn(_:)), userInfo: self.info, repeats: true)
    }
    
    @objc func changeBtn(_ sender: Timer) { // looping ends but does not get to invalidate
        guard let info = sender.userInfo as? CustomTimerInfo else{return}
        if info.loop % 2 == 1{
            self.btns[info.rand].setImage(self.brightBtnPics[info.rand], for: UIControl.State.normal) // sets bright
        }
        else {
            self.guesses.append(info.rand) // adds color number to lists
            self.btns[info.rand].setImage(self.regBtnPics[info.rand], for: UIControl.State.normal) // returns to regular
            info.setRand()
        }
        if info.loop == info.end { // resets btns and ends timer
            self.startBtn.isEnabled = true
            for btn in self.btns {
                btn.isEnabled = true
            }
            sender.invalidate()
        }
        info.loop += 1
    }
    
    @IBAction func redClick(_ sender: Any) {
        self.guesses.append(0)
    }
    
    @IBAction func greenClick(_ sender: Any) {
        self.guesses.append(1)
    }
    
    @IBAction func blueClick(_ sender: Any) {
        self.guesses.append(2)
    }
    
    @IBAction func yellowClick(_ sender: Any) {
        self.guesses.append(3)
    }
    
   
    
   
}

