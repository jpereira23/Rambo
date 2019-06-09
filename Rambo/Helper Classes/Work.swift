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
    var startDate: Date!
    var endDate: Date!
    var city: String!
    var description: String!
    
    init(){
        jobTitle = ""
        companyName = ""
        startDate = Date()
        endDate = Date()
        city = ""
        description = ""
    }
}
