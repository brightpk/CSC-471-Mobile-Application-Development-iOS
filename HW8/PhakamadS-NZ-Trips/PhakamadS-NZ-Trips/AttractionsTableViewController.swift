//
//  AttractionsTableViewController.swift
//  PhakamadS-NZ-Trips
//
//  Created by Bright Phakamad on 3/8/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class AttractionsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return northAttractions.count
        } else {
            return southAttractions.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "North Island"
        } else {
            return "South Island"
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let north = northAttractions[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: north.island.rawValue, for: indexPath)
            cell.textLabel?.text = north.name
            cell.detailTextLabel?.text = north.island.rawValue
             return cell
        } else {
            let south = southAttractions[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: south.island.rawValue, for: indexPath)
            cell.textLabel?.text = south.name
            cell.detailTextLabel?.text = south.island.rawValue
            return cell
        }
    
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
         if let infoViewController = segue.destination as? InfoViewController {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                if indexPath.section == 0 {
                    infoViewController.attraction = northAttractions[indexPath.row]
                } else {
                    infoViewController.attraction = southAttractions[indexPath.row]
                }
            }
        }
        
    }
    

}
