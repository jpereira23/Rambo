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
            
        }
        // Do any additional setup after loading the view.
    }


}

