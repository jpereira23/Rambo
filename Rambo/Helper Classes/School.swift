//
//  School.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/8/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import Foundation

class School{
    var schoolName: String!
    var degree: String!
    var areaOfStudy: String!
    var startDate: String!
    var endDate: Date!
    var stillEmployee: Bool!
    var city: String!
    
    init(aSchoolName: String, aDegree: String, aAreaOfStudy: String, aStartDate: String, aEndDate: Date, aStillEmployee: Bool, aCity: String){
        schoolName = aSchoolName
        degree = aDegree
        areaOfStudy = aAreaOfStudy
        startDate = aStartDate
        endDate = aEndDate
        stillEmployee = aStillEmployee
        city = aCity
    }
    
    init(){
        schoolName = ""
        degree = ""
        areaOfStudy = ""
        startDate = ""
        endDate = Date()
        stillEmployee = false
        city = ""
    }
    
    func printThis(){
        NSLog("schoolName: \(self.schoolName)")
        NSLog("degree: \(self.degree)")
        NSLog("areaOfStudy: \(self.areaOfStudy)")
        NSLog("city: \(self.city)")
    }
    
    
}
