//
//  User.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/14/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class User: NSObject{
    var username: String = ""
    var email: String = ""
    var password: String = ""
    
    override init(){
        super.init()
    }
    
    init(aUsername: String, aPassword: String, aEmail: String){
        username = aUsername
        password = aPassword
        email = aEmail
    }
    
}
