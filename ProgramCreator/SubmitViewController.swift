//
//  SubmitViewController.swift
//  ProgramCreator
//
//  Created by Marco Nie on 25/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController,UITextFieldDelegate {
    
    var info = Info()
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if emailAddress.text != "" {
            info.modifyEmailAddress(email: emailAddress.text!)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var emailAddress: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if emailAddress.text != "" {
            info.modifyEmailAddress(email: emailAddress.text!)
        }
        return true
    }
    
}
