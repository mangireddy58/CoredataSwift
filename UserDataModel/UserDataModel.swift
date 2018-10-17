//
//  UserDataModel.swift
//  Rawandale
//
//  Created by Rushikesh Kulkarni on 27/12/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import CoreData

class UserDataModel: NSObject {
    
    static let userDataSharedInstance = UserDataModel()
    
    var mUserName:String! = ""
    var mPassword:String! = ""
    var mDeviceToken:Int! = 0
    
    
    func saveData(username: String, password: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if #available(iOS 10.0, *) {
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "UserPersonalData", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            
            let checking : Bool = checkIfItExist(username: username)
            
            if checking == false {
                newUser.setValue(username, forKey: "userName")
                newUser.setValue(password, forKey: "emailId")
                
                do {
                    try context.save()
                    print("Saved")
                } catch {
                    print("Failed saving")
                }
            }
            else {
                print("already exists")
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    func checkIfItExist(username : String) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if #available(iOS 10.0, *) {
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName:"UserPersonalData")
            request.returnsObjectsAsFaults = false
            do {
                let results = try context.fetch(request)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        mUserName = result.value(forKey:"userName")as? String
                        
                        if mUserName != nil {
                            if username.elementsEqual(mUserName) {
                                return true
                            }
                        }
                    }
                    return false
                }
                else {
                    return false
                }
            }
            catch {
                //
                print("Unable to fetch saved data")
                return false
            }
        } else {
            // Fallback on earlier versions
        }
        return false
    }
    
    func getUserData() -> Dictionary <Int, Any> {
        // fetching the data
        var userDict : Dictionary<Int, Any>! = [:]
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if #available(iOS 10.0, *) {
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName:"UserPersonalData")
            request.returnsObjectsAsFaults = false
            do {
                let results = try context.fetch(request)
                if results.count > 0 {
                    var testValue : Int = 0
                    for result in results as! [NSManagedObject] {
                        mUserName = result.value(forKey:"userName")as? String
                        mPassword = result.value(forKey:"emailId")as? String
                        print(mUserName)
                        print(mPassword)
                        if mUserName != nil  && mPassword != nil{
                            testValue = testValue + 1
                            
                            var tempDict : Dictionary<String, Any>! = [:]
                            tempDict.updateValue(mUserName, forKey: "username")
                            tempDict.updateValue(mPassword, forKey: "email")
                            
                            userDict.updateValue(tempDict, forKey: testValue)
                        }
                        
                    }
                }
            }
            catch {
                //
                print("Unable to fetch saved data")
            }
        } else {
            // Fallback on earlier versions
        }
        return userDict
    }
    
//    func getSavedUserDict(userDataDict: NSDictionary) {
//        mUserName = ""
//        if (userDataDict["userName"]as AnyObject) as? NSNull != NSNull() {
//            UserDataModel.userDataSharedInstance.mUserName = userDataDict["userName"] as AnyObject as? String
//        }
//
//    }
//
//    func saveUserName(userName:String) {
//        mUserName = userName
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        if #available(iOS 10.0, *) {
//            let context = appDelegate.persistentContainer.viewContext
//            let entity = NSEntityDescription.entity(forEntityName: "UserPersonalData", in: context)
//            let newUser = NSManagedObject(entity: entity!, insertInto: context)
//            newUser.setValue(userName, forKey: "userName")
//            do {
//                try context.save()
//                print("Saved")
//            } catch {
//                print("Failed saving")
//            }
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//    func getSavedUserName() {
//        self.printData()
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        if #available(iOS 10.0, *) {
//            let context = appDelegate.persistentContainer.viewContext
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserPersonalData")
//            request.returnsObjectsAsFaults = false
//            do {
//                let result = try context.fetch(request)
//                print(result)
//                for data in result as! [NSManagedObject] {
//                    mUserName = (data.value(forKey: "userName") as! String)
//                    mPassword =  (data.value(forKey: "emailId") as! String)
//                    print(data.value(forKey: "deviceToken") as! Int)
//                }
//            } catch {
//                print("Failed")
//            }
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//    // Printing the data
//    func printData() {
//        print(mUserName)
//        print(mPassword)
//    }

}
