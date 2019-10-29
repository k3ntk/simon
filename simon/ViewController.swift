//
//  ViewController.swift
//  simon
//
//  Created by Kent Koehler on 9/20/19.
//  Copyright © 2019 Kent Koehler. All rights reserved.
//

import UIKit

class CustomTimerInfo { // timer info class
    var end = 4 // number of cycles * 2
    var loop = 1
    var rand = Int.random(in: 0...3)
    
    func setRand() {
        self.rand = Int.random(in: 0...3)
    }
    
    func lvlUp(){
        end += 4 // adds 2 to the number of cycles
    }
}

class ViewController: UIViewController { // TODO: make difficulty increase with size of order changing

    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var answerLbl: UILabel!
    
    let timerInfo = CustomTimerInfo()
    
    // bright image colors for blinking -- not sure if works fingers crossed
    let brightBtnPics: [UIImage] = [UIImage(named: "brightRed")!, UIImage(named: "brightGreen")!, UIImage(named: "brightBlue")!, UIImage(named: "brightYellow")!]
    let regBtnPics: [UIImage] = [UIImage(named: "red")!, UIImage(named: "green")!, UIImage(named: "blue")!, UIImage(named: "yellow")!]
    var currColors = 4 // current amount of colors to remember
    var btns: [UIButton] = [] // future list of btns but cant create here
    var guesses: [Int] = [] // guesses for order
    var order: [Int] = [] // order of colors
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startBtn.layer.cornerRadius = 4
        self.answerLbl.layer.cornerRadius = 4
        self.btns = [redBtn, greenBtn, blueBtn, yellowBtn] // red 0, green 1, blue 2, yellow 3
        for btn in self.btns {
            btn.isEnabled = false // disable guess btns so no problems
        }
        for i in 0...3{ // sets picture for disabled state
            self.btns[i].setImage(self.regBtnPics[i], for: UIControl.State.disabled)
        }
    }

    @IBAction func start(_ sender: Any) {
        self.answerLbl.text = nil // resets text label
        self.answerLbl.backgroundColor = UIColor.black
        self.timerInfo.loop = 1 // reset loop
        self.guesses.removeAll() // resets lists
        self.order.removeAll()
        self.startBtn.isEnabled = false // disable button on button press
        let _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeBtn(_:)), userInfo: self.timerInfo, repeats: true)
    }
    
    @objc func changeBtn(_ sender: Timer) { // timer fire function
        guard let info = sender.userInfo as? CustomTimerInfo else{return}
        if info.loop % 2 == 1{
            info.setRand() // sets rand
            self.order.append(info.rand) // appends rand
            self.btns[info.rand].setImage(self.brightBtnPics[info.rand], for: UIControl.State.normal) // sets bright
            self.btns[info.rand].setImage(self.brightBtnPics[info.rand], for: UIControl.State.disabled)
        }
        else {
            self.btns[info.rand].setImage(self.regBtnPics[info.rand], for: UIControl.State.normal) // returns to regular
            self.btns[info.rand].setImage(self.regBtnPics[info.rand], for: UIControl.State.disabled)

        }
        if info.loop == info.end { // resets btns and ends timer
            for btn in self.btns {
                btn.isEnabled = true
            }
            sender.invalidate()
        }
        info.loop += 1
    }
    
    // for each button press append that color code to guess list and check if list full
    @IBAction func redClick(_ sender: Any) {
        self.guesses.append(0)
        checker()
    }
    
    @IBAction func greenClick(_ sender: Any) {
        self.guesses.append(1)
        checker()
    }
    
    @IBAction func blueClick(_ sender: Any) {
        self.guesses.append(2)
        checker()
    }
    
    @IBAction func yellowClick(_ sender: Any) {
        self.guesses.append(3)
        checker()
    }
    
    func checker(){
        if self.guesses[self.guesses.count - 1] != self.order[self.guesses.count - 1]{ // if incorrect guess
            self.answerLbl.backgroundColor = UIColor.red
            self.answerLbl.text = "incorrect"
            for btn in self.btns {
                btn.isEnabled = false // disable guess btns so no problems
            }
            self.startBtn.isEnabled = true
        }
        else if self.guesses.count == self.order.count { // if all correct
            self.answerLbl.backgroundColor = UIColor.green
            self.answerLbl.text = "correct"
            self.timerInfo.lvlUp() // adds 2 to cycle
            for btn in self.btns {
                btn.isEnabled = false // disable guess btns so no problems
            }
            self.startBtn.isEnabled = true
        }
    }
}
