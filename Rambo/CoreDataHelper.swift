//
//  CoreDataHelper.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/12/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import CoreData

/**
 *  CoreDataHelper, this class at the moment is helping with pulling the logged in
 *  user from the iPhone
 */
class CoreDataHelper{
    private var managedObjects = [NSManagedObject]()
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var managedContext: NSManagedObjectContext!
    private var userEntity: NSEntityDescription!
    
    /**
     *  Initializing entity User
     *
     */
    init(){
        self.managedContext = self.appDelegate.persistentContainer.viewContext
        self.userEntity = NSEntityDescription.entity(forEntityName: "User", in: self.managedContext)
    }
    
    public func saveUser(profile: Profile){
        let theUser = NSManagedObject(entity: self.userEntity!, insertInto: self.managedContext)
        
        theUser.setValue(profile.getUsername(), forKeyPath: "username")
        theUser.setValue(profile.getEmail(), forKeyPath: "email")
        theUser.setValue(profile.getPassword(), forKeyPath: "password")
        
        do{
            try self.managedContext.save()
            managedObjects.append(theUser)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
        }
    }
    
    public func loadUser() -> Profile?{
        var tempProfile: Profile = Profile()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        
        do{
            managedObjects = try self.managedContext!.fetch(fetchRequest)
        } catch let error as NSError{
            NSLog(error.localizedDescription)
        }
        
        if(managedObjects.count > 0){
            let theUsername = (managedObjects[0].value(forKeyPath: "username") as! String)
            let thePassword = (managedObjects[0].value(forKeyPath: "password") as! String)
            let theEmail = (managedObjects[0].value(forKeyPath: "email") as! String)
            
            tempProfile = Profile(username: theUsername, password: thePassword, email: theEmail)
            
            return tempProfile
        }
        return nil
    }
    
}
