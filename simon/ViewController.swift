//
//  ViewController.swift
//  simon
//
//  Created by Kent Koehler on 9/20/19.
//  Copyright © 2019 Kent Koehler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    // bright image colors for blinking -- not sure if works fingers crossed
    let brightBtnPics: [UIImage] = [UIImage(named: "brightRed")!, UIImage(named: "brightGreen")!, UIImage(named: "brightBlue")!, UIImage(named: "brightYellow")!]
    let regBtnPics: [UIImage] = [UIImage(named: "red")!, UIImage(named: "green")!, UIImage(named: "blue")!, UIImage(named: "yellow")!]
    var currColors = 4 // current amount of colors to remember
    var btns: [UIButton] = [] // future list of btns but cant create here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btns = [redBtn, greenBtn, blueBtn, yellowBtn]
    }

    @IBAction func start(_ sender: Any) { // maybe put timer as class variable to access in all functions
        startBtn.isEnabled = false // disable button on button press
        var rand = 0
        var loop = 0
        let t = Timer(timeInterval: 1.0, target: self, selector: #selector(changeBtn(loop:rand:btns:)), userInfo: nil, repeats: true) // WTFFFFFFFFF
//        let t = Timer(timeInterval: 1, repeats: true, block: {_ in // on fire - increment loop, run changeBtn
//            loop += 1
//            if loop % 2 == 1 {
//                rand = Int.random(in: 0...3)
//            }
//            self.changeBtn(loop: loop, rand: rand, btns: self.btns)
//        })
        t.fire() // dont know how to stop the timer
    }
    
    @objc func changeBtn(loop: Int, rand: Int, btns: [UIButton]) {
        if loop % 2 == 1 {
            btns[rand].setImage(brightBtnPics[rand], for: UIControl.State.normal) // set bright pic
        }
        else {
            btns[rand].setImage(regBtnPics[rand], for: UIControl.State.normal) // set reg pic
        }
    }
    
    @IBAction func blueClick(_ sender: Any) {
        
    }
    
    @IBAction func yellowClick(_ sender: Any) {
        
    }
    
    @IBAction func greenClick(_ sender: Any) {
        
    }
    
    @IBAction func redClick(_ sender: Any) {
        
    }
}

