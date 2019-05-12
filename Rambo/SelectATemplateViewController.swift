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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if coreDataHelper.loadUser() != nil{
            
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "onBoarding")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = vc
            //self.present(vc!, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }


}

