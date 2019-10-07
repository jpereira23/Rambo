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
    var isEdit: Bool = false
    var editIndex: Int = 0
    let cloudKit = CloudKitHelper()
    var iCloudLoggedIn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        saveToPhone.layer.cornerRadius = 5.0
//        if #available(iOS 13.0, *) {
//            preferredUserInterfaceStyle = .light
//        } else {
//            // Fallback on earlier versions
//        }
//        if #available(iOS 13.0, *) {
//            overrideUserInterfaceStyle = .light
//        } else {
//            // Fallback on earlier versions
//        }
        webView.layer.shadowColor = UIColor.black.cgColor
        webView.layer.shadowOffset = CGSize(width: 0, height: 1)
        webView.layer.shadowOpacity = 0.1
        webView.layer.shadowRadius = 5.0
        webView.layer.masksToBounds = false
        webView.isUserInteractionEnabled = false
        
        //Check iCloud user
        
        
        
        if let currentToken = FileManager.default.ubiquityIdentityToken{
            NSLog("iCloud exists")
            saveToPhone.setTitle("Export to Files", for: .normal)
            iCloudLoggedIn = true
        } else {
            saveToPhone.setTitle("Save (read only)", for: .normal)
            iCloudLoggedIn = false
        }
        
        
        let url = Bundle.main.url(forResource: "master", withExtension: "html")
        if isEdit == false{
        coreDataHelper.saveFullResume(fullResume: fullResume)
        } else if isEdit == true{
            coreDataHelper.updateResume(index: editIndex, fullResume: fullResume)
        }
        node.setFirstName(name: fullResume.basicInfo.fullName)
        node.setEmail(email: fullResume.basicInfo.email)
        node.setNumber(number: fullResume.basicInfo.phoneNumber)
        node.setObjective(objective: fullResume.objective)
        var schoolCount: Int = 0
        for school in fullResume.arrayOfSchools{
            if schoolCount == 0{
                node.addInstitution(institution: school.schoolName, date: school.startDate + " - " + school.endDate , degree: school.areaOfStudy, skillSet: school.degree, isFirst: true)
            } else {
                node.addInstitution(institution: school.schoolName, date: school.startDate + " - " + school.endDate , degree: school.areaOfStudy, skillSet: school.degree, isFirst: false)
            }
            
            schoolCount += 1
        }
        
        var workCount = 0
        for work in fullResume.arrayOfWorks{
            if workCount == 0{
                node.addWorkExperience(company: work.companyName, position: work.jobTitle, date: work.startDate + " - " + work.endDate, sub: work.description, isFirst: true)
            } else {
                node.addWorkExperience(company: work.companyName, position: work.jobTitle, date: work.startDate + " - " + work.endDate, sub: work.description, isFirst: false)
            }
            
            workCount += 1
            
        }
        var skillCount = 0
        for skill in fullResume.skills{
            
            if skillCount == 0{
                node.addSkill(aSkill: skill, isFirst: true)
            } else {
                node.addSkill(aSkill: skill, isFirst: false)
            }
            
            skillCount += 1
            
        }
        
        if fullResume.skills.count == 0{
            node.noSkills()
        }
        node.setCSS(css: fullResume.index)
        webView.loadHTMLString(node.combinedHTML, baseURL: url)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.modalPresentationStyle = .fullScreen
    }
    
    @IBAction func saveToiPhone(_ sender: Any) {
        
        if iCloudLoggedIn == true {
            let alertMenu = UIAlertController(title: "Save Your Resume", message: "Please provide a name for your resume.", preferredStyle: .alert)
            
            alertMenu.addTextField(configurationHandler:  { (textField: UITextField!) -> Void in
                textField.placeholder = "Steve Jobs Resume"
            })
            let submitAction = UIAlertAction(title: "Save", style: .default){ _ in
                let firstTextField = alertMenu.textFields![0] as! UITextField
                self.fileName = firstTextField.text!
                
                let fileFinishedMenu = UIAlertController(title: "Resume Successfully Saved", message: "View your resume in your files app (Files > On My iPhone > Worthy)", preferredStyle: .alert)
                
                let doneAction = UIAlertAction(title: "Great! Thank you.", style: .cancel){ _ in
                    self.changeToMain()
                }
                
                fileFinishedMenu.addAction(doneAction)
                self.savePDFToiPhone()
                self.present(fileFinishedMenu, animated: true, completion: nil)
                
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                
            }
            alertMenu.addAction(submitAction)
            alertMenu.addAction(cancelAction)
            
            self.present(alertMenu, animated: true, completion:nil)
        } else {
            let noiCloudAlert = UIAlertController(title: "iCloud disabled", message: "iCloud account not logged in/iCloud drive not turned on. Go to Settings > iCloud, log into iCloud and make sure iCloud drive is turned on for 'Worthy' app.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .cancel){ _ in
                self.changeToMain()
            }
            
            noiCloudAlert.addAction(okAction)
            
            self.present(noiCloudAlert, animated: true, completion: nil)
        }
        
        cloudKit.saveRecord()
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
        
        
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)
        
        for i in 0..<render.numberOfPages{
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
