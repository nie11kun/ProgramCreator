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
    
    let extractMainData = ExtractMainData()
    var customerInfoNameIndex: Int?
    
    override func viewDidLoad() {
        self.navigationItem.title = extractMainData.customerInfoNames()[customerInfoNameIndex!]
        detailCustomInfoText.text = extractMainData.customerInfoContents()[customerInfoNameIndex!]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        extractMainData.UserCustomerInfoContents(index: customerInfoNameIndex!, value: detailCustomInfoText.text)
    }
    
}
