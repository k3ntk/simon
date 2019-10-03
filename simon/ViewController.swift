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

    @IBAction func start(_ sender: Any) {
        self.startBtn.isEnabled = false // disable button on button press
        let end = 10
        let t = Timer(timeInterval: 1, target: self, selector: #selector(changeBtn(sender:)), userInfo: ["loop": 1, "rand": Int.random(in: 1...3), "end": end], repeats: true)
    }
    
    @objc func changeBtn(sender: Timer) { // looping ends but does not get to invalidate
        guard var info = sender.userInfo as? [String: Int] else {sender.invalidate(); return}
        if info["loop"]! % 2 == 1{
            print("bright")
        }
        else {
            print("regular")
        }
        if info["loop"]! == info["end"]! {
            self.startBtn.isEnabled = true
            sender.invalidate()
        }
        info["loop"]! += 1
        info["rand"]! = Int.random(in: 1...3)
        print(info["rand"]!)
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

