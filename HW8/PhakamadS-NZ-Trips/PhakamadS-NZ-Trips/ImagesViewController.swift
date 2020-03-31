//
//  ImagesViewController.swift
//  PhakamadS-NZ-Trips
//
//  Created by Bright Phakamad on 3/8/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class ImagesViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    var attraction: Attraction?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let att = attraction {
            titleLabel.text = att.name
            image1.image = UIImage(named: att.name.replacingOccurrences(of: "/", with: ":") + "1")
            image2.image = UIImage(named: att.name.replacingOccurrences(of: "/", with: ":") + "2")
            
            if att.island.rawValue == "North Island" {
                titleLabel.textColor = UIColor(red: 105/255, green: 180/255, blue: 83/255, alpha: 1.0)
            } else {
                titleLabel.textColor = UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 1.0)
            }
        }
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
