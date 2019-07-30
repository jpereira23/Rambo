//
//  ExportViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 7/3/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import WebKit

class ExportViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var saveToPhone: UIButton!
    var node: Node = Node()
    var fullResume: FullResume!
    var coreDataHelper: CoreDataHelper = CoreDataHelper()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveToPhone.layer.cornerRadius = 5
        
        webView.layer.shadowColor = UIColor.black.cgColor
        webView.layer.shadowOffset = CGSize(width: 0, height: 1)
        webView.layer.shadowOpacity = 0.1
        webView.layer.shadowRadius = 5.0
        webView.layer.masksToBounds = false
        
        
        let url = Bundle.main.url(forResource: "sample_one", withExtension: "html")
        
        coreDataHelper.saveFullResume(fullResume: fullResume)
        node.setFirstName(name: fullResume.basicInfo.fullName)
        node.setEmail(email: fullResume.basicInfo.email)
        node.setNumber(number: fullResume.basicInfo.phoneNumber)
        node.setObjective(objective: fullResume.objective)
        for school in fullResume.arrayOfSchools{
            node.addInstitution(institution: school.schoolName, date: "Fuck it" , degree: school.degree)
        }
        
        for work in fullResume.arrayOfWorks{
            node.addWorkExperience(company: work.companyName, date: "Fuck it", sub: work.description)
        }
        
        for skill in fullResume.skills{
            node.addSkill(skill: skill)
        }
        
        node.setCSS(css: fullResume.index)
        
        webView.loadHTMLString(node.combinedHTML, baseURL: url)
        // Do any additional setup after loading the view.
        
        
        //coreDataHelper.loadFullResume()
        /*
        if let loadFullProfile = coreDataHelper.loadFullResume(){
            for profile in loadFullProfile{
                NSLog(profile.basicInfo.fullName)
            }
        }
        */
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.modalPresentationStyle = .fullScreen
    }
    
    @IBAction func saveToiPhone(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainView") as! MainViewController
        self.present(vc, animated: true, completion: nil)
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
