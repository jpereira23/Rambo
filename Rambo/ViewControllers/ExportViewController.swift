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
    var node: Node = Node()
    var fullResume: FullResume!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "sample_one", withExtension: "html")
        
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
        
        node.setCSS(css: 1)
        
        webView.loadHTMLString(node.combinedHTML, baseURL: url)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.modalPresentationStyle = .fullScreen
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
