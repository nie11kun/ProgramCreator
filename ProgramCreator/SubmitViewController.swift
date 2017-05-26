//
//  SubmitViewController.swift
//  ProgramCreator
//
//  Created by Marco Nie on 25/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController,UITextFieldDelegate {
    
    let extractMainData = ExtractMainData()
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if emailAddress.text != "" {
            extractMainData.userEmailContent(content: emailAddress.text!)
            extractMainData.saveAllData()
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var emailAddress: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if extractMainData.markUserEmailContent() {
            emailAddress.text = extractMainData.EmailContent()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        extractMainData.userEmailContent(content: emailAddress.text!)
        return true
    }
    
}
