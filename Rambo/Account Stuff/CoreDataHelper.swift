//
//  CoreDataHelper.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/14/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import CoreData



class CoreDataHelper{
    private var managedObjects = [NSManagedObject]()
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var managedContext: NSManagedObjectContext!
    private var profileEntity: NSEntityDescription!
    
    init(){
        
 
        //self.managedContext = self.appDelegate.persistentContainer.viewContext
        //self.profileEntity = NSEntityDescription.entity(forEntityName: "FullResume", in: self.managedContext)
        
    }
    /*
     
    public func saveProfile(user: User){
        let theProfile = NSManagedObject(entity: self.profileEntity!, insertInto: self.managedContext)
        
        theProfile.setValue(user.email, forKeyPath: "email")
        theProfile.setValue(user.password, forKeyPath: "password")
        theProfile.setValue(user.username, forKeyPath: "username")
        
        do{
            try self.managedContext.save()
            managedObjects.append(theProfile)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
        }
        
    }
    
    public func loadProfile() -> User?{
        var tempUser: User = User()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Profile")
        
        do {
            managedObjects = []
            managedObjects = try self.managedContext!.fetch(fetchRequest)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
        }
        
        if(managedObjects.count > 0){
            let theEmail = (managedObjects[0].value(forKeyPath: "email") as! String)
            let thePassword = (managedObjects[0].value(forKeyPath: "password") as! String)
            let theUsername = (managedObjects[0].value(forKeyPath: "username") as! String)
            
            tempUser = User(aPassword: thePassword, aEmail: theEmail, aUsername: theUsername)
            
            return tempUser
        }
        
        return nil
    }
    
    public func resetCoreData()
    {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        
        do {
            _ = try self.managedContext.execute(request)
        } catch let error as NSError {
            print("Could not save. \(error). \(error.userInfo)")
        }
    }
 */
}
