//
//  MachineInfo.swift
//  ProgramCreator
//
//  Created by Marco Nie on 23/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import Foundation

class Info {
    
    private let customerInfoIndex: [String]?
    private let machineInfoIndex: [String]?
    private let machineInfoIndexMachineType: [String]?
    private let machineInfoIndexDressType: [String]?
    private let machineInfoIndexToolSet: [String]?
    private let machineInfoIndexAutoRotation: [String]?
    private let emailAddress: String?
    
    private var customerInfoInputed: [String]?
    private var machineInfoSlected: [String]?
    
    var machineInfoTitle: String?
    var machineInfoIndexSlected: IndexPath?
    var machineInfoDidSlected: [String]?
    
    var customerInfoTitle: String?
    var customerInfoIndexSlected: IndexPath?
    
    init() {
        if let url = Bundle.main.url(forResource: "mainData", withExtension: "json"),
            let data = NSData(contentsOf: url),
            let feed = ( try? JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)) as? NSDictionary {
            let customerInfoIndex = feed.value(forKeyPath: "data.customerInfoIndex.index") as? [String]
            let machineInfoIndex = feed.value(forKeyPath: "data.machineInfoIndex.index") as? [String]
            let machineInfoIndexMachineType = feed.value(forKeyPath: "data.machineInfoIndex.machineType") as? [String]
            let machineInfoIndexDressType = feed.value(forKeyPath: "data.machineInfoIndex.dressType") as? [String]
            let machineInfoIndexToolSet = feed.value(forKeyPath: "data.machineInfoIndex.toolSet") as? [String]
            let machineInfoIndexAutoRotation = feed.value(forKeyPath: "data.machineInfoIndex.autoRotation") as? [String]
            let customerInfoInputed = feed.value(forKeyPath: "data.customerInfoIndex.slected") as? [String]
            let machineInfoSlected = feed.value(forKeyPath: "data.machineInfoIndex.slected") as? [String]
            let emailAddress = feed.value(forKeyPath: "data.email") as? String
            self.customerInfoIndex = customerInfoIndex
            self.machineInfoIndex = machineInfoIndex
            self.machineInfoIndexMachineType = machineInfoIndexMachineType
            self.machineInfoIndexDressType = machineInfoIndexDressType
            self.machineInfoIndexToolSet = machineInfoIndexToolSet
            self.machineInfoIndexAutoRotation = machineInfoIndexAutoRotation
            self.customerInfoInputed = customerInfoInputed
            self.machineInfoSlected = machineInfoSlected
            self.emailAddress = emailAddress
        } else {
            self.customerInfoIndex = nil
            self.machineInfoIndex = nil
            self.machineInfoIndexMachineType = nil
            self.machineInfoIndexDressType = nil
            self.machineInfoIndexToolSet = nil
            self.machineInfoIndexAutoRotation = nil
            self.customerInfoInputed = nil
            self.machineInfoSlected = nil
            self.emailAddress = nil
        }
    }
    
    func customerInfoIndex(index: Int) -> String? {
        if index >= 0 && index < (customerInfoIndex?.count)! {
            return customerInfoIndex?[index]
        } else {
            return nil
        }
    }
    
    func machineInfoIndex(index: Int) -> String? {
        if index >= 0 && index < (machineInfoIndex?.count)! {
            return machineInfoIndex?[index]
        } else {
            return nil
        }
    }
    
    func emailAddressIs() -> String? {
        return self.emailAddress
    }
    
    func machineInfoDidSlected(index: Int) -> [String]? {
        if index >= 0 && index < (machineInfoIndex?.count)! {
            if index == 0 {
                return machineInfoIndexMachineType
            } else if index == 1 {
                return machineInfoIndexDressType
            } else if index == 2 {
                return machineInfoIndexToolSet
            } else {
                return machineInfoIndexAutoRotation
            }
        } else {
            return nil
        }
    }
    
    func customerInfoDidInputed(index: Int) -> String? {
        return self.customerInfoInputed?[index]
    }
    
    func detailMachineInfoDidSlected(index: Int) -> String? {
        return self.machineInfoSlected?[index]
    }
    
    func ModifyCustomerInfoDidInputed(Index: Int, contents: String) {
        customerInfoInputed?[Index] = contents
    }
    
    func ModifyDetailMachineInfoDidSlected(Index: Int, contents: String) {
        machineInfoSlected?[Index] = contents
    }
    
    func customerInfoCount() -> Int? {
        return customerInfoIndex?.count
    }
    
    func machineInfoCount() -> Int? {
        return machineInfoIndex?.count
    }
    
}
