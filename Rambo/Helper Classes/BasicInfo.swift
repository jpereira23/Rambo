//
//  BasicInfo.swift
//  Rambo
//
//  Created by Jeffery Pereira on 7/7/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import Foundation


class BasicInfo{
    var fullName: String!
    var email: String!
    var phoneNumber: String!
    var link: String!
    
    
    init(fN: String, e: String, pN: String, l: String){
        fullName = fN
        email = e
        phoneNumber = pN
        link = l
    }
}
