//
//  OnBoardingViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/12/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subHeaderLabel: UILabel!
    let arrayOfHeaders: [String] = ["Welcome to Worthy", "Select a Template", "Add Your Details", "Export and Apply to Jobs"]
    let arrayOfSubHeaders: [String] = ["Your Convenient Resume Builder", "Get started by choosing one of our job-worthy resume template", "Enter your unique qualifications through our simple prompts", "Export your resume and kick start your job hunt more ready than before"]
    @IBOutlet weak var ContinueButton: UIButton!
    @IBOutlet weak var aView: UIView!
    var constant: Int = 0
    let buttonView: ChangeSceneIndicator = ChangeSceneIndicator(frame: CGRect(x: 0, y: 0, width: 139, height: 139))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContinueButton.setTitle("Continue", for: .normal)
        
        headerLabel.text = arrayOfHeaders[0]
        subHeaderLabel.text = arrayOfSubHeaders[0]
        
        
        aView.addSubview(buttonView)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        constant += 1
        if(constant == 4){
            NSLog("constant == 4")
            
                let vc = storyboard?.instantiateViewController(withIdentifier: "templateView")
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = vc
 
            
        } else {
            buttonView.next()
            headerLabel.text = arrayOfHeaders[constant]
            subHeaderLabel.text = arrayOfSubHeaders[constant]
            if(constant == 3)
            {
                ContinueButton.setTitle("Build My Resume", for: .normal)
            }
        }
        
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
