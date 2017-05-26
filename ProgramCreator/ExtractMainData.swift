//
//  extractMainData.swift
//  ProgramCreator
//
//  Created by Marco Nie on 26/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import Foundation

class ExtractMainData {

    private var feed = NSDictionary(contentsOf: Bundle.main.url(forResource: "MainData", withExtension: "plist")!)
    
    func EmailContent() -> String {
        let key = "UserEmailContent"
        return UserDefaults.standard.object(forKey: key) as! String
    }
    
    func userEmailContent(content: String) {
        let key = "UserEmailContent"
        let markKey = "MarkUserEmailContent"
        UserDefaults.standard.set(content, forKey: key)
        UserDefaults.standard.set(true, forKey: markKey)
        UserDefaults.standard.synchronize()
    }
    
    func markUserEmailContent() -> Bool {
        let markKey = "MarkUserEmailContent"
        if (UserDefaults.standard.object(forKey: markKey) != nil) {
            return true
        } else {
            return false
        }
    }
    
    func customerInfo() -> [String] {
        return feed?.value(forKeyPath: "data.customerInfo") as! [String]
    }
    
    func customerInfo(index: Int) -> String {
        return customerInfo()[index]
    }
    
    func customerInfoNames() -> [String] {
        var customerInfoNames = [String]()
        for index in 0...(customerInfo().count - 1) {
            customerInfoNames.append(customerInfo(index: index))
        }
        return customerInfoNames
    }
    
    func customerInfoContents() -> [String] {
        let contentsKey = ""
        var customerInfoContents = [String]()
        for index in 0...(customerInfo().count - 1) {
            let key = "CustomerInfoContent: \(index)"
            if UserDefaults.standard.object(forKey: key) != nil {
                customerInfoContents.append(UserDefaults.standard.object(forKey: key) as! String)
            } else {
                customerInfoContents.append(contentsKey)
            }
        }
        return customerInfoContents
    }
    
    func UserCustomerInfoContents(index: Int, value: String) {
        let key = "CustomerInfoContent: \(index)"
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func machineInfo() -> Array<Any> {
        return feed?.value(forKeyPath: "data.machineInfo") as! Array
    }
    
    func machineInfoName(index: Int) -> String {
        let key = "name"
        let machineInfoNameIndex = machineInfo()[index] as! NSDictionary
        return machineInfoNameIndex.object(forKey: key) as! String
    }
    
    func machineInfoNames() -> [String] {
        var machineInfoNames = [String]()
        for index in 0...(machineInfo().count - 1) {
            machineInfoNames.append(self.machineInfoName(index: index))
        }
        return machineInfoNames
    }
    
    func machineInfoContents(index: Int) -> [String] {
        let key = "content"
        let machineInfoContentsIndex = machineInfo()[index] as! NSDictionary
        return machineInfoContentsIndex.object(forKey: key) as! [String]
    }
    
    func slectedMachineInfoContents() -> [String] {
        let contentsKey = ""
        var slectedMachineInfoContents = [String]()
        for index in 0...(machineInfo().count - 1) {
            let key = "SlectedMachineInfoContent: \(index)"
            if UserDefaults.standard.object(forKey: key) != nil {
                slectedMachineInfoContents.append(UserDefaults.standard.object(forKey: key) as! String)
            } else {
                slectedMachineInfoContents.append(contentsKey)
            }
        }
        return slectedMachineInfoContents
    }
    
    func userSlectedMachineInfoContents(index: Int, value: String) {
        let key = "SlectedMachineInfoContent: \(index)"
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func userSlectedMachineInfoContentsIndexPath(index: Int, value: IndexPath) {
        let markKey = "IfHaveSlectedMachineInfoContentsIndexPath: \(index)"
        let key = "SlectedMachineInfoContentsIndexPath: \(index)"
        let exchangeValue = ["section": value.section, "row": value.row]
        UserDefaults.standard.set(exchangeValue, forKey: key)
        UserDefaults.standard.set(true, forKey: markKey)
    }
    
    func IfHaveSlectedMachineInfoContentsIndexPath(index: Int) -> Bool {
        let markKey = "IfHaveSlectedMachineInfoContentsIndexPath: \(index)"
        if UserDefaults.standard.object(forKey: markKey) != nil {
            return true
        } else {
            return false
        }
    }
    
    func userSlectedMachineInfoContentsIndexPath(index: Int) -> IndexPath {
        let key = "SlectedMachineInfoContentsIndexPath: \(index)"
        let exchangeValue =  UserDefaults.standard.object(forKey: key) as! NSDictionary
        var value: IndexPath?
        let sectionForValue = exchangeValue.object(forKey: "section") as! Int
        let rowForValue = exchangeValue.object(forKey: "row") as! Int
        value = IndexPath.init(row: rowForValue, section: sectionForValue)
        return value!
    }
    
    func saveAllData() {
        let allDataKey = "AllData"
        let allData = [
            "customerInfo": self.customerInfoContents(), "machineInfo": self.slectedMachineInfoContents(), "email": self.EmailContent()
        ] as NSDictionary
        UserDefaults.standard.set(allData, forKey: allDataKey)
        UserDefaults.standard.synchronize()
    }
    
}
