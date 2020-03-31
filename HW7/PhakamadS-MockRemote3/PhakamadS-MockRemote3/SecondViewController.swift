//
//  SecondViewController.swift
//  PhakamadS-MockRemote3
//
//  Created by Bright Phakamad on 2/24/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var DVRPowerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var DVRPowerSwitch: UISwitch!
    
    @IBOutlet var buttons: [UIButton]!
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in print("cancel")})
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DVRPowerLabel.text = "On"
        stateLabel.text = "Stopped"
    }
    

    @IBAction func switchDVRPower(_ sender: UISwitch) {
        let enabled = sender.isOn
        DVRPowerLabel.text = enabled ? "On"  : "Off"
        DVRPowerSwitch.setOn(enabled, animated: true)
        if enabled {
            stateLabel.text = "Stopped"
        }
        for button in buttons {
            button.isEnabled = enabled
        }
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        if stateLabel.text == "Recording" {
             let alertController = self.getAlertController(stateClicked: "Play")
             let forceAction = self.getForceAction(title: "Force to Play anyway!", ForceTo: "Playing")
             let actions: [UIAlertAction] = [forceAction, cancelAction]
             for action in actions {
                 alertController.addAction(action)
             }
             present(alertController, animated: true, completion: nil)
         } else {
            stateLabel.text = "Playing"
         }
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        stateLabel.text = "Stopped"
    }
    
    
    @IBAction func pausePressed(_ sender: UIButton) {
        if stateLabel.text == "Recording" {
            let alertController = self.getAlertController(stateClicked: "Pause")
            let forceAction = self.getForceAction(title: "Force to Pause anyway!", ForceTo: "Paused")
            let actions: [UIAlertAction] = [forceAction, cancelAction]
            for action in actions {
                alertController.addAction(action)
            }
            present(alertController, animated: true, completion: nil)
        } else {
          stateLabel.text = "Paused"
        }
    }
    
    
    @IBAction func fastForwardPressed(_ sender: UIButton) {
        if stateLabel.text == "Recording" {
          let alertController = self.getAlertController(stateClicked: "Fast forward")
          let forceAction = self.getForceAction(title: "Force to Fast forward anyway!", ForceTo: "Fast forwarding")
          let actions: [UIAlertAction] = [forceAction, cancelAction]
          for action in actions {
              alertController.addAction(action)
          }
          present(alertController, animated: true, completion: nil)
      } else {
        stateLabel.text = "Fast forwarding"
      }
    }
    
    @IBAction func fastRewindPressed(_ sender: UIButton) {
        if stateLabel.text == "Recording" {
            let alertController = self.getAlertController(stateClicked: "Fast rewind")
            let forceAction = self.getForceAction(title: "Force to Fast rewind anyway!", ForceTo: "Fast rewinding")
            let actions: [UIAlertAction] = [forceAction, cancelAction]
            for action in actions {
                alertController.addAction(action)
            }
            present(alertController, animated: true, completion: nil)
        } else {
            stateLabel.text = "Fast rewinding"
        }
    }
    
    @IBAction func recordPressed(_ sender: UIButton) {
        if stateLabel.text != "Stopped" && stateLabel.text != "Recording" {
            let alertController = self.getAlertController(stateClicked: "Record")
            let forceAction = self.getForceAction(title: "Force to record anyway!", ForceTo: "Recording")
            let actions: [UIAlertAction] = [forceAction, cancelAction]
            for action in actions {
                alertController.addAction(action)
            }
            present(alertController, animated: true, completion: nil)
        } else {
            stateLabel.text = "Recording"
        }
    }
    
    func getAlertController(stateClicked: String) -> UIAlertController {
        let currentState = stateLabel.text!
        let title = "Warning from \(currentState) state"
        let message = "\(stateClicked) is not recommended on this state"
        return UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    }

    // forceAction popup when a button is pressed while the DVR is in a state where the requested operation is not possible
    func getForceAction(title: String, ForceTo: String) -> UIAlertAction {
        let forceAction = UIAlertAction(title: title, style: .default)
        { _ in
            self.changeState(state: ForceTo)
            let confirmAlertController = UIAlertController(
                title: "Confirming that the current operation has been stopped and the requested operation proceeds",
                message: nil,
                preferredStyle: .alert)
            confirmAlertController.addAction(UIAlertAction(
                title: "OK",
                style: .default
//                ,handler: { (action) -> Void in self.changeState(state: ForceTo) }
            ))
            self.present(confirmAlertController,
                animated: true,
                completion: nil)
            }
        return forceAction
    }
    
    // change state
    func changeState(state: String) {
        stateLabel.text = state
    }


}

