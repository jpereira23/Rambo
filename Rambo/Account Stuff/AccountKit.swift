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
    init(){
        //fetchUserRecordID()
    }
    
    func saveProfile(email: String, password: String, view: UIViewController){
        let privateDatabase = CKContainer.default().privateCloudDatabase
        
        if user == nil{
            user = CKRecord(recordType: "Profile")
        }
        
        user?.setObject(email as __CKRecordObjCValue, forKey: "email")
        user?.setObject(password as __CKRecordObjCValue, forKey: "password")
        
        privateDatabase.save(user!){ (record, error) -> Void in
            DispatchQueue.main.sync {
                if (error != nil) {
                    NSLog(error!.localizedDescription)
                }
                
                let user: User = User(aPassword: password, aEmail: email)
                self.coreDataHelper.saveProfile(user: user)
                view.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    private func fetchUserRecordID(){
        let defaultContainer = CKContainer.default()
        
        defaultContainer.fetchUserRecordID { (recordID, error) -> Void in
            if let responseError = error {
                print(responseError)
            } else if let userRecordID = recordID {
                DispatchQueue.main.sync {
                    self.fetchUserRecord(recordID: userRecordID)
                }
            }
        }
    }
    
    private func fetchUserRecord(recordID: CKRecord.ID){
        let defaultContainer = CKContainer.default()
        
        let privateDatabase = defaultContainer.privateCloudDatabase
        
        let query = CKQuery(recordType: "Profile", predicate: NSPredicate(value: true))
        
        // query.sortDescriptors = [NSSortDescriptor(key: "username", ascending: true)]
        
        privateDatabase.perform(query, inZoneWith: nil) { (records, error) in records!.forEach({ (record) in
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            
            
            print(record.value(forKey: "email") ?? "")
        })}
    }
}
