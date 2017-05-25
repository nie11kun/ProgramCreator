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
    
    var mainData = MainData()
    
    override func viewDidLoad() {
        self.navigationItem.title = mainData.customerInfoTitle
        detailCustomInfoText.text = mainData.customerInfoDidInputed(index: (mainData.customerInfoIndexSlected?.row)!)
        detailCustomInfoText.text = mainData.customerInfoDidInputed(index: (mainData.customerInfoIndexSlected?.row)!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        mainData.ModifyCustomerInfoDidInputed(Index: (mainData.customerInfoIndexSlected?.row)!, contents: detailCustomInfoText.text)
    }
    
}
