//
//  FullResume.swift
//  Rambo
//
//  Created by Jeffery Pereira on 7/7/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import Foundation

class FullResume{
    var basicInfo: BasicInfo!
    var objective: String!
    var arrayOfWorks: [Work] = []
    var arrayOfSchools: [School] = []
    var skills: [String] = []
    var index: Int
    
    init(bI: BasicInfo, o: String, aW: [Work], aS: [School], s: [String], i: Int){
        basicInfo = bI
        objective = o
        arrayOfWorks = aW
        arrayOfSchools = aS
        skills = s
        index = i
    }
}
