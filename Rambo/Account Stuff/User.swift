//
//  User.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/14/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class User: NSObject{
    var email: String = ""
    var password: String = ""
    
    override init(){
        super.init()
    }
    
    init(aPassword: String, aEmail: String){
        password = aPassword
        email = aEmail
    }
    
}
