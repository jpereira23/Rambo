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
        
        
 
        self.managedContext = self.appDelegate.persistentContainer.viewContext
        self.profileEntity = NSEntityDescription.entity(forEntityName: "ABasicInfo", in: self.managedContext)
    }
    
     
    public func saveResume(fullResume: BasicInfo){
        let theProfile = NSManagedObject(entity: self.profileEntity!, insertInto: self.managedContext)
        
        theProfile.setValue(fullResume.email, forKeyPath: "email")
        theProfile.setValue(fullResume.fullName, forKeyPath: "fullName")
        theProfile.setValue(fullResume.link, forKeyPath: "link")
        //theProfile.setValue(fullResume.objective, forKeyPath: "objective")
        theProfile.setValue(fullResume.phoneNumber, forKeyPath: "phoneNumber")
        
        do{
            try self.managedContext.save()
            managedObjects.append(theProfile)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
        }
        
    }
     
    public func saveSchool(school: School){
     
    }
    
    public func loadProfile() -> BasicInfo?{
        var tempFullResume: BasicInfo!
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ABasicInfo")
        
        do {
            managedObjects = []
            managedObjects = try self.managedContext!.fetch(fetchRequest)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
        }
        
        if(managedObjects.count > 0){
            let theEmail = (managedObjects[0].value(forKeyPath: "email") as! String)
            let theFullName = (managedObjects[0].value(forKeyPath: "fullName") as! String)
            let theLink = (managedObjects[0].value(forKeyPath: "link") as! String)
            //let theObjective = (managedObjects[0].value(forKeyPath: "objective") as! String)
            let thePhoneNumber = (managedObjects[0].value(forKeyPath: "phoneNumber") as! String)
            
            tempFullResume = BasicInfo(fN: theFullName, e: theEmail, pN: thePhoneNumber, l: theLink)
            
            return tempFullResume
        }
        
        return nil
    }
    
    public func resetCoreData()
    {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "ABasicInfo")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        
        do {
            _ = try self.managedContext.execute(request)
        } catch let error as NSError {
            print("Could not save. \(error). \(error.userInfo)")
        }
    }
}
