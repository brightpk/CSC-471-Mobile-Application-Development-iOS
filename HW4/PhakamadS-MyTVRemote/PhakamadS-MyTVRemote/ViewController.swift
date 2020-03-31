//
//  ViewController.swift
//  PhakamadS-MyTVRemote
//
//  Created by Bright Phakamad on 2/7/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var favoriteChannelSegmented: UISegmentedControl!
    
    @IBOutlet var channelButtons: [UIButton]!
    @IBOutlet var controllerLabels: [UILabel]!
    
    var isPressedNumber = false
    var favoriteChannel = "07"
    var listOfFavorite = ["07", "05", "02", "32"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        powerLabel.text = "On"
        volumeLabel.text = "\(Int(volumeSlider.value))"
        channelLabel.text = favoriteChannel
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        let enabled = sender.isOn
        powerLabel.text = enabled ? "On"  : "Off"
        powerSwitch.setOn(enabled, animated: true)
        
        volumeSlider.isEnabled = enabled
        favoriteChannelSegmented.isEnabled = enabled
        
        for button in channelButtons {
            button.isEnabled = enabled
        }

        if enabled == false {
            for label in controllerLabels {
                label.textColor = UIColor.lightGray
            }
        } else {
            for label in controllerLabels {
                label.textColor = UIColor.black
            }
        }
        
        
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        volumeLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!

        if Int(number) == 0 && Int(channelLabel.text!) == 0 {
            channelLabel.text = "0"
            isPressedNumber = false
        }
        
        if isPressedNumber {
            channelLabel.text = channelLabel.text! + number
            isPressedNumber = false
        } else {
            channelLabel.text = number
            isPressedNumber = true
        }
        
        // check if it's favorite channel
        for  i in 0..<listOfFavorite.count {
            if channelLabel.text == listOfFavorite[i] {
                favoriteChannelSegmented.selectedSegmentIndex = i
            }
        }
    }
    
    @IBAction func channelPlus(_ sender: UIButton) {
        if Int(channelLabel.text!)! == 99 {
            channelLabel.text = "99"
        } else {
            var number = Int(channelLabel.text!)!
            number = number + 1
            
            if channelLabel.text!.starts(with: "0") && channelLabel.text != "09" {
                 channelLabel.text! = "0\(number)"
            } else {
                channelLabel.text! = "\(number)"
            }
        }
        
        // check if it's favorite channel
        for  i in 0..<listOfFavorite.count {
            if channelLabel.text == listOfFavorite[i] {
                favoriteChannelSegmented.selectedSegmentIndex = i
            }
        }
    }
    
    @IBAction func channelMinus(_ sender: UIButton) {
        
        if Int(channelLabel.text!)! == 01 {
            channelLabel.text = "01"
        } else {
            var number = Int(channelLabel.text!)!
            number = number - 1
            
            if channelLabel.text!.starts(with: "0") || number < 10 {
                 channelLabel.text! = "0\(number)"
            } else {
                channelLabel.text! = "\(number)"
            }
           
        }
        
        // check if it's favorite channel
        for  i in 0..<listOfFavorite.count {
            if channelLabel.text == listOfFavorite[i] {
                favoriteChannelSegmented.selectedSegmentIndex = i
            }
        }
    }
    

    @IBAction func favoriteChannelSelected(_ sender: UISegmentedControl) {
        let picked = sender.selectedSegmentIndex
        
        switch picked {

        case 0:
            favoriteChannel = listOfFavorite[0]
        case 1:
            favoriteChannel = listOfFavorite[1]
        case 2:
            favoriteChannel = listOfFavorite[2]
        case 3:
            favoriteChannel =  listOfFavorite[3]
        default:
            favoriteChannel = listOfFavorite[0]
        }

        channelLabel.text = favoriteChannel

    }
    
}

