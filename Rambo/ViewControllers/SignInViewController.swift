//
//  SignInViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/20/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import CloudKit


class SignInViewController: UIViewController {
    let accountKit: AccountKit! = AccountKit()
    
    let username: String! = "User"
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signIn(_ sender: Any) {
        if accountKit.checkAccount(email: emailField.text!, password: passwordField.text!, view: self){
            
            NSLog("Successful")
            //accountKit.saveProfile(email: emailField.text, password: passwordField.text, username: <#T##String#>, view: <#T##UIViewController#>)
            
            //self.dismiss(animated: true, completion: nil)
            
        } else {
            NSLog("Unsuccessful")
        }
    }
    
}
