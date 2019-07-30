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
    private var workEntity: NSEntityDescription!
    private var schoolEntity: NSEntityDescription!
    private var fullResumeEntity: NSEntityDescription!
    private var skillsEntity: NSEntityDescription!
    
    init(){
        
        
 
        self.managedContext = self.appDelegate.persistentContainer.viewContext
        self.profileEntity = NSEntityDescription.entity(forEntityName: "ABasicInfo", in: self.managedContext)
        self.fullResumeEntity = NSEntityDescription.entity(forEntityName: "AFullResume", in: self.managedContext)
        self.workEntity = NSEntityDescription.entity(forEntityName: "AWork", in: self.managedContext)
        self.schoolEntity = NSEntityDescription.entity(forEntityName: "ASchool", in: self.managedContext)
        self.skillsEntity = NSEntityDescription.entity(forEntityName: "ASkill", in: self.managedContext)
    }
    
     
    public func saveResume(fullResume: BasicInfo){
        let theProfile = NSManagedObject(entity: self.profileEntity!, insertInto: self.managedContext)
        
        theProfile.setValue(fullResume.email, forKeyPath: "email")
        theProfile.setValue(fullResume.fullName, forKeyPath: "fullName")
        theProfile.setValue(fullResume.link, forKeyPath: "link")
        theProfile.setValue(fullResume.phoneNumber, forKeyPath: "phoneNumber")
        
        do{
            try self.managedContext.save()
            managedObjects.append(theProfile)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
        }
        
    }
    
    public func saveFullResume(fullResume: FullResume){
        let theFullResume = NSManagedObject(entity: self.fullResumeEntity!, insertInto: self.managedContext)
        
        theFullResume.setValue(fullResume.objective, forKeyPath: "objective")
        let theProfile = NSManagedObject(entity: self.profileEntity!, insertInto: self.managedContext)
        
        theProfile.setValue(fullResume.basicInfo.email, forKeyPath: "email")
        theProfile.setValue(fullResume.basicInfo.fullName, forKeyPath: "fullName")
        theProfile.setValue(fullResume.basicInfo.link, forKeyPath: "link")
        theProfile.setValue(fullResume.basicInfo.phoneNumber, forKeyPath: "phoneNumber")
        theFullResume.setValue(fullResume.index, forKeyPath: "index") 
        
        let works = theFullResume.mutableSetValue(forKey: "works")
        
        for work in fullResume.arrayOfWorks{
            let aWork = NSManagedObject(entity: self.workEntity!, insertInto: self.managedContext)
            
            aWork.setValue(work.jobTitle, forKeyPath: "jobTitle")
            aWork.setValue(work.city, forKeyPath: "city")
            aWork.setValue(work.companyName, forKeyPath: "companyName")
            aWork.setValue(work.description, forKeyPath: "aDescription")
            aWork.setValue("9/7/2019", forKeyPath: "startDate")
            aWork.setValue("9/7/2019", forKeyPath: "endDate")
            
            works.add(aWork)
        }
        
        let schools = theFullResume.mutableSetValue(forKey: "schools")
        
        for school in fullResume.arrayOfSchools{
            let aSchool = NSManagedObject(entity: self.schoolEntity!, insertInto: self.managedContext)
            
            aSchool.setValue(school.areaOfStudy, forKeyPath: "areaOfStudy")
            aSchool.setValue(school.city, forKeyPath: "city")
            aSchool.setValue(school.degree, forKeyPath: "degree")
            aSchool.setValue("9/7/2019", forKeyPath: "endDate")
            aSchool.setValue("9/7/2019", forKeyPath: "startDate")
            aSchool.setValue(school.schoolName, forKeyPath: "schoolName")
            
            schools.add(aSchool)
        }
        
        let skills = theFullResume.mutableSetValue(forKey: "skills")
        
        for skill in fullResume.skills{
            let aSkill = NSManagedObject(entity: self.skillsEntity!, insertInto: self.managedContext)
            
            aSkill.setValue(skill, forKeyPath: "aSkill")
            skills.add(aSkill)
        }
        
        let aBasicInfos = theFullResume.mutableSetValue(forKey: "aBasicInfo")
        aBasicInfos.add(theProfile)
        
        do{
            try self.managedContext.save()
            managedObjects.append(theFullResume)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
        }
    }
    
    public func loadFullResume() -> [FullResume] {
        var tempFullResume: [FullResume] = []
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AFullResume")
        
        do {
            managedObjects = []
            managedObjects = try self.managedContext!.fetch(fetchRequest)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
        }
        
        if(managedObjects.count > 0){
            var tmpFullResume: FullResume!
            var basicInfoTemplate: BasicInfo!
            
            
            let theObjects: [AFullResume] = managedObjects as! [AFullResume]
            
            for object in theObjects{
                let anObjects: [ABasicInfo] = (object.aBasicInfo?.allObjects)! as! [ABasicInfo]
                let works: [AWork] = (object.works?.allObjects)! as! [AWork]
                let schools: [ASchool] = (object.schools?.allObjects)! as! [ASchool]
                let skills: [ASkill] = (object.skills?.allObjects)! as! [ASkill]
                
                basicInfoTemplate = BasicInfo(fN: anObjects[0].fullName!, e: anObjects[0].email!, pN: anObjects[0].phoneNumber!, l: anObjects[0].link!)
                
                var arrayOfWorks: [Work] = []
                
                for work in works{
                    let aWork = Work()
                    aWork.jobTitle = work.jobTitle
                    aWork.description = work.aDescription
                    aWork.city = work.city
                    aWork.companyName = work.companyName
                    aWork.endDate = Date()
                    aWork.startDate = Date()
                    arrayOfWorks.append(aWork)
                }
                
                var arrayOfSchools: [School] = []
                
                for school in schools{
                    let aSchool = School()
                    aSchool.areaOfStudy = school.areaOfStudy
                    aSchool.city = school.city
                    aSchool.degree = school.degree
                    aSchool.endDate = Date()
                    aSchool.startDate = Date()
                    aSchool.schoolName = school.schoolName
                    arrayOfSchools.append(aSchool)
                }
                var arrayOfSkills: [String] = []
                
                for skill in skills{
                    let aSkill = skill.aSkill
                    
                    arrayOfSkills.append(aSkill!)
                }
                NSLog("object index is \(object.index)")
                tmpFullResume = FullResume(bI: basicInfoTemplate, o: object.objective!, aW: arrayOfWorks, aS: arrayOfSchools, s: arrayOfSkills, i: Int(object.index))
                tempFullResume.append(tmpFullResume)
            }
        }
        return tempFullResume
        
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
        
        let fetch1 = NSFetchRequest<NSFetchRequestResult>(entityName: "AFullResume")
        let request1 = NSBatchDeleteRequest(fetchRequest: fetch1)
        
        do {
            _ = try self.managedContext.execute(request1)
        } catch let error as NSError {
            print("Could not save. \(error). \(error.userInfo)")
        }
        
        let fetch2 = NSFetchRequest<NSFetchRequestResult>(entityName: "AWork")
        let request2 = NSBatchDeleteRequest(fetchRequest: fetch2)
        
        do {
            _ = try self.managedContext.execute(request2)
        } catch let error as NSError {
            print("Could not save. \(error). \(error.userInfo)")
        }
        
        let fetch3 = NSFetchRequest<NSFetchRequestResult>(entityName: "ASchool")
        let request3 = NSBatchDeleteRequest(fetchRequest: fetch3)
        
        do {
            _ = try self.managedContext.execute(request3)
        } catch let error as NSError {
            print("Could not save. \(error). \(error.userInfo)")
        }
    }
}
