//
//  SubmitViewController.swift
//  ProgramCreator
//
//  Created by Marco Nie on 25/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController,UITextFieldDelegate {
    
    var mainData = MainData()
    let mainDataKey = "mainData"
    var extractedMainData: NSDictionary?
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if emailAddress.text != "" {
            mainData.modifyEmailAddress(email: emailAddress.text!)
            saveMainData()
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var emailAddress: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emailAddress.text = mainData.emailAddressIs()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if emailAddress.text != "" {
            mainData.modifyEmailAddress(email: emailAddress.text!)
        }
        return true
    }
    
    func saveMainData() {
        if let customerInfoInputed = mainData.customerInfoInputedIs(),
            let machineInfoSlected = mainData.machineInfoSlectedIs(),
            let email = emailAddress.text {
                extractedMainData = ["customerInfoInputed": customerInfoInputed, "machineInfoSlected": machineInfoSlected, "email": email]
                UserDefaults.standard.set(extractedMainData, forKey: mainDataKey)
                UserDefaults.standard.synchronize()
        }
    }
    
}
