//
//  ViewController.swift
//  CoreDataSwift
//
//  Created by Sai Praveen Kumar on 16/10/18.
//  Copyright © 2018 Mangi. All rights reserved.
//

import UIKit

class ViewController: RootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveData()
    }

    func saveData() -> Void {
        UserDataModel.userDataSharedInstance.saveData(username: "Test", password: "Test")
        UserDataModel.userDataSharedInstance.saveData(username: "Test1", password: "Test1")
        UserDataModel.userDataSharedInstance.saveData(username: "Test2", password: "Test2")
        
        var testDict : Dictionary <Int, Any> = [:]
        testDict = UserDataModel.userDataSharedInstance.getUserData()
        print(testDict)
    }
}

