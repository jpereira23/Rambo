//
//  ResumePreviewViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/2/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import WebKit


class ResumePreviewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var node: Node = Node()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.modalPresentationStyle = .fullScreen
//        if #available(iOS 13.0, *) {
//            self.preferredUserInterfaceStyle = .light
//        } else {
//            // Fallback on earlier versions
//        }
        
        node.setFirstName(name: "Jeff")
        node.setLastName(name: "Pereira")
        node.setNumber(number: "209-207-4507")
        node.setEmail(email: "jefferypereira3@gmail.com")
        node.setObjective(objective: "Trying to be an involved piece of shit, with a fat rod in my ass.")
        //node.setInstitution(institution: "CSU Chico")
        //node.setInstitutionDate(date: "August 2012 - December 2017")
        //node.setDegree(degree: "Computer Science B.A.")
        //node.setCompany(company: "Martin Brower L.L.C")
        //node.setCompanyDate(date: "February 2018 - Present")
        //node.setCompanySubHeader(sub: "Just helping McDonalds flip patties and Chipotle make some fat ass burritos.")
        
        //node.addWorkExperience(company: "BitchesRuS", date: "January 1969 - December 1969", sub: "You know I got out that bitch at the right time if it wasnt the year 1970....")
        //node.addWorkExperience(company: "LostAllTheComedyInTheLastOne", date: "January 2020-December 2020", sub: "Dull AF.")
        
        //node.addInstitution(institution: "UC Santa Barbara", date: "September 1994-Present", degree: "Uh B.A.")
        //node.addInstitution(institution: "UCLA", date: "Never - Never", degree: "What B.A.")
        
        //node.setSkill(skill: "Bitches")
        
        //node.addSkill(aSkill: "STDs")
        //node.addSkill(aSkill: "How many more bitches????")
        node.setCSS(css: 3)
        
        
        let url = Bundle.main.url(forResource: "resume", withExtension: "html")!
        webView.loadHTMLString(node.combinedHTML, baseURL: url)
        
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
