//
//  ViewController.swift
//  PhakamadS-Calculator
//
//  Created by Bright Phakamad on 1/29/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayNumber: UILabel!
    var isPressedNumber = false
    var isPressedEqual = false
    var operation = ""
    var result = 0
    var previousValue = 0
    var currentValue = 0
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if isPressedNumber == true {
            displayNumber.text = displayNumber.text! + number
        } else {
            displayNumber.text = number
            isPressedNumber = true
        }
        
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        isPressedNumber = false
        operation = sender.currentTitle!

        if isPressedEqual {
            previousValue = result
            isPressedEqual = false
        } else {
            previousValue = previousValue +  Int(displayNumber.text!)!
        }
        displayNumber.text = "\(previousValue)"
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        isPressedNumber = false
        currentValue = Int(displayNumber.text!)!
        
        if operation == "+" {
            result = previousValue + currentValue
            isPressedEqual = true
        }
        
        displayNumber.text = "\(result)"
        
    }
    
    @IBAction func clear(_ sender: UIButton) {
        previousValue = 0
        currentValue = 0
        result = 0
        isPressedEqual = false
        displayNumber.text = "0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

