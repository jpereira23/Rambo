//
//  ViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/10/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class SelectATemplateViewController: UIViewController {
    let coreDataHelper: CoreDataHelper = CoreDataHelper()
    var aChange: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "onBoarding")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = vc
            print("First launch, setting UserDefault.")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
        /*
        if aChange == false || coreDataHelper.loadProfile() != nil {
            
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "onBoarding")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = vc
        }
         */
        // Do any additional setup after loading the view.
    }

    @IBAction func submitResume(_ sender: Any) {
        if coreDataHelper.loadProfile() == nil{
            let vc = storyboard?.instantiateViewController(withIdentifier: "SignUp")
            self.present(vc!, animated: false, completion:   nil)
        }
    }
    
}

