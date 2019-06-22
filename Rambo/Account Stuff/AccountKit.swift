//
//  AccountKit.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/16/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import CloudKit

class AccountKit{
    
    var user: CKRecord? = CKRecord(recordType: "Profile")
    let coreDataHelper: CoreDataHelper = CoreDataHelper()
    var arrayOfUsers: [User] = []
    init(){
        fetchUserRecord()
    }
    
    func saveProfile(email: String, password: String, username: String) {
        let privateDatabase = CKContainer.default().privateCloudDatabase
        
        if user == nil{
            user = CKRecord(recordType: "Profile")
        }
        
        user?.setObject(email as __CKRecordObjCValue, forKey: "email")
        user?.setObject(password as __CKRecordObjCValue, forKey: "password")
        user?.setObject(username as __CKRecordObjCValue, forKey: "username")
        
        privateDatabase.save(user!){ (record, error) -> Void in
            DispatchQueue.main.sync {
                if (error != nil) {
                    NSLog(error!.localizedDescription)
                }
                
                let user: User = User(aPassword: password, aEmail: email, aUsername: username)
                self.coreDataHelper.saveProfile(user: user)
                //view.dismiss(animated: true, completion: nil)
            }
        }
    }
    func saveProfile(email: String, password: String, username: String, view: UIViewController){
        let privateDatabase = CKContainer.default().privateCloudDatabase
        
        if user == nil{
            user = CKRecord(recordType: "Profile")
        }
        
        user?.setObject(email as __CKRecordObjCValue, forKey: "email")
        user?.setObject(password as __CKRecordObjCValue, forKey: "password")
        user?.setObject(username as __CKRecordObjCValue, forKey: "username")
        
        privateDatabase.save(user!){ (record, error) -> Void in
            DispatchQueue.main.sync {
                if (error != nil) {
                    NSLog(error!.localizedDescription)
                }
                
                let user: User = User(aPassword: password, aEmail: email, aUsername: username)
                self.coreDataHelper.saveProfile(user: user)
                let aView = view.presentingViewController as! MainViewController
                aView.refreshPage()
                view.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    private func fetchUserRecord(){
        let defaultContainer = CKContainer(identifier: "iCloud.Jeff.ResumeBuilder")
        
        let privateDatabase = defaultContainer.privateCloudDatabase
        
        let query = CKQuery(recordType: "Profile", predicate: NSPredicate(value: true))
        
        //query.sortDescriptors = [NSSortDescriptor(key: "username", ascending: true)]
        
        privateDatabase.perform(query, inZoneWith: nil) { (records, error) in records!.forEach({ (record) in
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            let p = record.value(forKey: "password") as! String
            let u = record.value(forKey: "username") as! String
            let e = record.value(forKey: "email") as! String
            let aUser: User = User(aPassword: p, aEmail: e, aUsername: u)
            self.arrayOfUsers.append(aUser)
        })}
    }
    
    func checkAccount(email: String, password: String, view: UIViewController) -> Bool{
        for account in arrayOfUsers{
            NSLog("account email: \(account.email), email: \(email)")
            NSLog("account password: \(account.password), password: \(password)")
            if account.email == email && account.password == password{
                self.saveProfile(email: account.email, password: account.password, username: account.username, view: view)
                
                return true
            }
        }
        
        return false
    }
}
