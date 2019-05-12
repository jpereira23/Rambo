//
//  Profile.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/12/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit


class Profile: NSObject{
    private var aUsername: String
    private var aPassword: String
    private var aEmail: String
    
    
    init(username: String, password: String, email: String){
        aUsername = username
        aPassword = password
        aEmail = email
    }
    
    override init(){
        aUsername = ""
        aPassword = ""
        aEmail = ""
    }
    
    public func getUsername() -> String{
        return aUsername
    }
    
    public func getPassword() -> String{
        return aPassword
    }
    
    public func getEmail() -> String{
        return aEmail
    }
}
