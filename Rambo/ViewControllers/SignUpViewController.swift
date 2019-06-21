//
//  SignUpViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/16/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let accountKit: AccountKit = AccountKit()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .emailAddress
        // Do any additional setup after loading the view.
    }
 
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfScreenPresentation(presentedViewController: presented, presenting: presenting)
    }
    
    @IBAction func createAccount(_ sender: Any) {
        accountKit.saveProfile(email: emailTextField.text!, password: passwordTextField.text!, username: "", view: self)
    }
}

class HalfScreenPresentation: UIPresentationController{
    override var frameOfPresentedViewInContainerView: CGRect {
        let containerFrame = self.containerView!.frame
        
        return CGRect(x: 0, y: containerFrame.height/2, width: containerFrame.width, height: containerFrame.height/2)
    }
}
