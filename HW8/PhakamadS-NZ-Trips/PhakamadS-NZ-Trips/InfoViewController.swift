//
//  InfoViewController.swift
//  PhakamadS-NZ-Trips
//
//  Created by Bright Phakamad on 3/8/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var attraction: Attraction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let att = attraction {
            titleLabel.text = att.name
            imageView.image = UIImage(named: att.name.replacingOccurrences(of: "/", with: ":"))
            infoLabel.text = att.content
            
            if att.island.rawValue == "North Island" {
                titleLabel.textColor = UIColor(red: 105/255, green: 180/255, blue: 83/255, alpha: 1.0)
            } else {
                titleLabel.textColor = UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 1.0)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
         if let imagesViewController = segue.destination as? ImagesViewController {
            imagesViewController.attraction = attraction
        }
        
    }



}

