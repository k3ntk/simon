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
    
    // bright image colors for blinking
    let brightRed = UIImage(named: "brightRed.png")
    let brightGreen = UIImage(named: "brightGreen.png")
    let brightBlue = UIImage(named: "brightBlue.png")
    let brightYellow = UIImage(named: "brightyellow.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func start(_ sender: Any) {
        for _ in 0...10 {
            let tempRand = Int.random(in: 0...3)
            if tempRand == 0 {
                redBtn.setImage(brightRed, for: UIControl.State.normal)
            }
            else if tempRand == 1 {
                greenBtn.setImage
            }
            else if tempRand == 2 {
                
            }
            else if tempRand == 3 {
                
            }
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

