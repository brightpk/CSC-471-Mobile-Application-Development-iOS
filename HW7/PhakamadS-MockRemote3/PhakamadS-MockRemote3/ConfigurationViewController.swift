//
//  ConfigurationViewController.swift
//  PhakamadS-MockRemote3
//
//  Created by Bright Phakamad on 2/24/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {
    
    struct FavoriteChannelDetails {
        var index: Int?
        var name: String?
        var channel: String?
    }

    @IBOutlet weak var favoriteChannelSegment: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var segmentSelected = 0
    var newFavChannel = FavoriteChannelDetails()
    var newFavChannels = [FavoriteChannelDetails()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        channelLabel.text = "01"
        for _ in 1..<4 {
            newFavChannels.append(FavoriteChannelDetails())
        }
    }
    
    @IBAction func doneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func SegmentedControlSelected(_ sender: UISegmentedControl) {
        let picked = sender.selectedSegmentIndex
        switch picked {

        case 0:
            segmentSelected = 0
        case 1:
            segmentSelected = 1
        case 2:
             segmentSelected = 2
        case 3:
            segmentSelected = 3
        default:
            segmentSelected = 0
        }
    }
    
    @IBAction func textFilled(_ sender: UITextField) {
        let text = sender.text!
        let title = "Restrict characters length"
        let message = "Characters length needs to be between 1-4 and cannot be empty"
        
        if text == "" || text.count > 4 {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func plusMinusStepper(_ sender: UIStepper) {
        sender.minimumValue = 1
        sender.maximumValue = 99
        let value = Int(sender.value)
        
        if value <= 9 {
            channelLabel.text = "0" + String(value)
        } else {
            channelLabel.text = String(value)
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        if textField.text == ""  || textField.text!.count > 4 {
            let alertController = UIAlertController(title: "Invalid label", message: "Please enter the label and it should be between 1-4 characters", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertController, animated: true, completion: nil)
    
        } else {
            newFavChannel = FavoriteChannelDetails(index: segmentSelected, name: textField.text!, channel: channelLabel.text!)
            let top: UIViewController = self;
            let tv = top.tabBarController!.viewControllers![0] as! FirstViewController
            newFavChannels[segmentSelected] = newFavChannel
            tv.newFavChannels = newFavChannels
            let alertController = UIAlertController(title: "Your favorite channel is saved!", message: "Updated favorite channel info: \n Segment Button: \(newFavChannel.index!+1) \n Channel name: \(newFavChannel.name!) \n Channel Number: \(newFavChannel.channel!)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "GREAT!", style: .default))
            present(alertController, animated: true, completion: nil)
        }

    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Cancel current configuration", message: "Please note that the current value is clear", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alertController, animated: true, completion: nil)
        favoriteChannelSegment.selectedSegmentIndex = 0
        textField.text = ""
        channelLabel.text = "01"
        stepper.value = 1
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
