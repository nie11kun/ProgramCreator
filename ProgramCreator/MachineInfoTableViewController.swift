//
//  MachineInfoTableViewController.swift
//  ProgramCreator
//
//  Created by Marco Nie on 23/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit

class MachineInfoTableViewController: UITableViewController {

    
    let reusedInditifer = "MachineInfo"
    let info = Info()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = "Machine"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return info.machineInfoCount()!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusedInditifer, for: indexPath)
        if let lable = cell.textLabel {
            lable.text = info.machineInfoIndex(index: indexPath.row)
        }
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = info.detailMachineInfoDidSlected(index: indexPath.row)
        }
        // Configure the cell...
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MachineInfoDidSlected" {
            if let detailMachineInfoTableViewController = segue.destination as? DetailMachineInfoTableViewController,
                let cell = sender as? UITableViewCell,
                let index = self.tableView.indexPath(for: cell) {
                    info.machineInfoIndexSlected = index
                    info.machineInfoDidSlected = info.machineInfoDidSlected(index: index.row)
                    info.machineInfoTitle = info.machineInfoIndex(index: index.row)
                    detailMachineInfoTableViewController.info = info
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

}
