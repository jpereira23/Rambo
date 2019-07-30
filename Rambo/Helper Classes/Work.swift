//
//  Work.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/8/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import Foundation

class Work{
    var jobTitle: String!
    var companyName: String!
    var startDate: String!
    var endDate: String!
    var city: String!
    var description: String!
    
    init(){
        jobTitle = ""
        companyName = ""
        startDate = ""
        endDate = ""
        city = ""
        description = ""
    }
    
    func printThis(){
        NSLog("jobTitle: \(self.jobTitle)")
        NSLog("companyName: \(self.companyName)")
        NSLog("city: \(self.city)")
        NSLog("description: \(self.description)")
    }
}
