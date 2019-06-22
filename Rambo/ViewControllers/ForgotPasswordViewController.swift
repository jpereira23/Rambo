//
//  ForgotPasswordViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/22/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    let requestEmail: RequestEmail = Bundle.main.loadNibNamed("RequestEmail", owner: self, options: nil)?.first as! RequestEmail
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(requestEmail)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
