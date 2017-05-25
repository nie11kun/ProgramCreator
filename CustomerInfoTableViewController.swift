//
//  MachineInfoTableViewController.swift
//  ProgramCreator
//
//  Created by Marco Nie on 23/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit

class CustomerInfoTableViewController: UITableViewController {

    let reusedInditifer = "CustomerInfo"
    
    let mainData = MainData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = "Customer"
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
        return mainData.customerInfoCount()!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusedInditifer, for: indexPath)
        if let lable = cell.textLabel {
            lable.text = mainData.customerInfoIndex(index: indexPath.row)
        }
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = mainData.customerInfoDidInputed(index: indexPath.row)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CustomerInfoDidSlected" {
            if let detailCustomerInfoViewController = segue.destination as? DetailCustomerInfoViewController,
                let cell = sender as? UITableViewCell,
                let index = self.tableView.indexPath(for: cell) {
                    mainData.customerInfoTitle = mainData.customerInfoIndex(index: index.row)
                    mainData.customerInfoIndexSlected = index
                    detailCustomerInfoViewController.mainData = mainData
            }
        } else if segue.identifier == "Navigate to Machine" {
            if let machineInfoTableViewController = segue.destination as? MachineInfoTableViewController {
                machineInfoTableViewController.mainData = mainData
            }
        }
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

}
