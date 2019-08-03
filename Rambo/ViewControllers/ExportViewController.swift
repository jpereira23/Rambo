//
//  ExportViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 7/3/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import WebKit


class CustomPrintPageRenderer: UIPrintPageRenderer{
    let A4PageWidth: CGFloat = 595.2
    let A4PageHeight: CGFloat = 841.8
}


class ExportViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var saveToPhone: UIButton!
    var node: Node = Node()
    var fullResume: FullResume!
    var coreDataHelper: CoreDataHelper = CoreDataHelper()
    var fileName = "output"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveToPhone.layer.cornerRadius = 5
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }

        webView.layer.shadowColor = UIColor.black.cgColor
        webView.layer.shadowOffset = CGSize(width: 0, height: 1)
        webView.layer.shadowOpacity = 0.1
        webView.layer.shadowRadius = 5.0
        webView.layer.masksToBounds = false
        webView.isUserInteractionEnabled = false
        
        
        let url = Bundle.main.url(forResource: "sample_one", withExtension: "html")
        
        coreDataHelper.saveFullResume(fullResume: fullResume)
        node.setFirstName(name: fullResume.basicInfo.fullName)
        node.setEmail(email: fullResume.basicInfo.email)
        node.setNumber(number: fullResume.basicInfo.phoneNumber)
        node.setObjective(objective: fullResume.objective)
        for school in fullResume.arrayOfSchools{
            node.addInstitution(institution: school.schoolName, date: school.startDate + " - " + school.endDate , degree: school.degree)
        }
        
        for work in fullResume.arrayOfWorks{
            node.addWorkExperience(company: work.companyName, date: work.startDate + " - " + work.endDate, sub: work.description)
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
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.modalPresentationStyle = .fullScreen
    }
    
    @IBAction func saveToiPhone(_ sender: Any) {
        let alertMenu = UIAlertController(title: "Resume has been saved to Files application", message: "The file will be found under 'On my iPhone > Worthy'.", preferredStyle: .alert)
        
        alertMenu.addTextField(configurationHandler:  { (textField: UITextField!) -> Void in
            textField.placeholder = "File Name"
        })
        let submitAction = UIAlertAction(title: "Submit", style: .default){ _ in
            let firstTextField = alertMenu.textFields![0] as! UITextField
            self.fileName = firstTextField.text!
            
            self.savePDFToiPhone()
            self.changeToMain()
        }
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel) { _ in
            
        }
        alertMenu.addAction(submitAction)
        alertMenu.addAction(cancelAction)
        
        self.present(alertMenu, animated: true, completion:nil)
    }
    
    func changeToMain(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainView") as! MainViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    func savePDFToiPhone(){
        let render = UIPrintPageRenderer()
        
        render.addPrintFormatter(webView.viewPrintFormatter(), startingAtPageAt: 0)
        
        
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8)
        render.setValue(page, forKey: "paperRect")
        render.setValue(page, forKey: "printableRect")
        
        NSLog("number of pages \(render.numberOfPages)")
        
        
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)
        
        for i in 0..<render.numberOfPages{
            NSLog("Hello world")
            UIGraphicsBeginPDFPage();
            render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }
        

        UIGraphicsEndPDFContext();
        
        guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(fileName).appendingPathExtension("pdf") else {
            fatalError("Destination URL not created")
        }
        
        guard nil != (try? pdfData.write(to: outputURL, options: .atomic))
            else { fatalError("Error writing PDF data to file.") }
        
       
        
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
