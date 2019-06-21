//
//  CloudKitHelper.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/21/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import Foundation
import CloudKit



struct Profil{
    var username: String!
    var password: String!
    var email: String!
    
    init(u: String, p: String, e: String){
        username = u
        password = p
        email = e
    }
}
class CloudKitHelper{
    
    var arrayOfProfils: [Profil] = []
    
    init(){
        let privateDatabase = CKContainer(identifier: "iCloud.Jeff.ResumeBuilder").privateCloudDatabase
        let query = CKQuery(recordType: "Profile", predicate: NSPredicate(value: true))
        
        privateDatabase.perform(query, inZoneWith: nil) { (records, error) in
            records?.forEach({ (record) in
                guard error == nil else{
                    print(error?.localizedDescription as Any)
                    return
                }
                let u = record.value(forKey: "username") as! String
                let p = record.value(forKey: "password") as! String
                let e = record.value(forKey: "email") as! String
                
                let aProfile = Profil(u: u, p: p, e: e)
                
                self.arrayOfProfils.append(aProfile)
            })
        }
    }
    
    func checkAccount(email: String, password: String) -> Bool{
        for account in arrayOfProfils{
            if account.email == email && account.password == password{
                return true
            }
        }
        return false
    }
}
