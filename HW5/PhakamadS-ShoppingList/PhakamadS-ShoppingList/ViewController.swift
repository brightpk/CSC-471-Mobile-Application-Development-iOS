//
//  ViewController.swift
//  PhakamadS-ShoppingList
//
//  Created by Bright Phakamad on 2/15/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var itemsLabel: UILabel!
    var items = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        itemsLabel.numberOfLines = 0
        itemsLabel.text = "No item"
    }

    @IBAction func descriptionEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for field in textFields {
            field.resignFirstResponder()
        }
    }
    
    @IBAction func newList(_ sender: Any) {
        
        items = ""
        itemsLabel.text = "No item"
    }
    
    @IBAction func newItem(_ sender: Any) {
        for field in textFields {
            field.text = ""
        }
    }
    
    @IBAction func add(_ sender: Any) {
        var newItem : [Int : String] = [:]
        
        // title and message when inputs are invalid
        var title = ""
        var message = ""
        
        // create the action
        let OKAction = UIAlertAction(title: "Got it!", style: .cancel, handler: nil)

        for field in textFields {
            field.resignFirstResponder()
            newItem[field.tag] = field.text ?? ""
        }

        let description = newItem[0]!
        let quantity = newItem[1]!
        
        // when neither input is empty
        if (description == "" || quantity == "") {
           print("one of the input is empty")
            title = "Missing some field"
            message = "Neither description or quantity is missing, please fill up both fields. Otherwise no item will be added!"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            alertController.addAction(OKAction)
            present(alertController, animated: true, completion: nil)
        
        // when quantity is not number
        } else if (Int(textFields[1].text!) == nil) {
            title = "Invalid input"
            message = "Quantity can only be number. Please use only number"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            alertController.addAction(OKAction)
            present(alertController, animated: true, completion: nil)
        
        // when inputs are not empty and valid inputs
        } else if (description != "" && quantity != "") {
             let item = "\(quantity)x \(description)"
             if items == "" {
                 items += item
             } else {
                  items += "\n\(item)"
             }
             
             itemsLabel.text = items
             self.newItem(self)
             
         }
    
    }
    
    
}

