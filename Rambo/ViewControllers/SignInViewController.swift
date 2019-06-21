//
//  SignInViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/20/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    let cloudKitHelper = CloudKitHelper()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        cloudKitHelper.printStuff()
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

}
