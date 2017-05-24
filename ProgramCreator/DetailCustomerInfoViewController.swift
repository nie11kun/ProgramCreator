//
//  DetailCustomerInfoViewController.swift
//  ProgramCreator
//
//  Created by Marco Nie on 24/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit

class DetailCustomerInfoViewController: UIViewController {
    
    @IBOutlet weak var detailCustomInfoText: UITextView!
    
    var info = Info()
    
    override func viewDidLoad() {
        self.navigationItem.title = info.customerInfoTitle
        detailCustomInfoText.text = info.customerInfoDidInputed(index: (info.customerInfoIndexSlected?.row)!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        info.ModifyCustomerInfoDidInputed(Index: (info.customerInfoIndexSlected?.row)!, contents: detailCustomInfoText.text)
    }
    
}
