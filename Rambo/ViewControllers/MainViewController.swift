//
//  MainViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/19/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import WebKit

class MainViewController: UIViewController{

    @IBOutlet var buildNew: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var accountLabel: UILabel!
    let coreDataHelper: CoreDataHelper = CoreDataHelper()
    var isSignedIn: Bool = false
    var arrayOfResumes: [FullResume] = []
    var fileName: String = "output"
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if #available(iOS 13.0, *) {
////            preferredUserInterfaceStyle = .light
//        } else {
//            // Fallback on earlier versions
//        }
        //coreDataHelper.resetCoreData()
//        if #available(iOS 13.0, *) {
//            overrideUserInterfaceStyle = .light
//        } else {
//            // Fallback on earlier versions
//        }
        
        if let currentToken = FileManager.default.ubiquityIdentityToken{
            NSLog("iCloud is logged in")
        } else {
            NSLog("iCloud is not logged in")
        }
        buildNew.layer.cornerRadius = 5.0
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ThirdWayTableViewCell", bundle: bundle)
        self.tableView.register(nib, forCellReuseIdentifier: "cellBitch")
        
        arrayOfResumes = coreDataHelper.loadFullResume()
        if arrayOfResumes.count > 0{
            accountLabel.text = "Hi " + arrayOfResumes[0].basicInfo.fullName + "!"
        } else {
            accountLabel.text = "Hi there!"
        }
        
        self.tableView.reloadData()
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


extension MainViewController: UITableViewDelegate, UITableViewDataSource, ThirdWayTableViewCellDelegate, MainTableViewCellDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == arrayOfResumes.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBitch") as! ThirdWayTableViewCell
            cell.aDelegate = self
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell") as! MainTableViewCell
        cell.aDelegate = self
        
        if(UIScreen.main.bounds.width > 375.0){
            let leadingConstraint = NSLayoutConstraint(item: cell.stackView, attribute: .leading, relatedBy: .equal, toItem: cell, attribute: .leading, multiplier: 1.0, constant: 100.5)
            let trailingConstraint = NSLayoutConstraint(item: cell.stackView, attribute: .trailing, relatedBy: .equal, toItem: cell, attribute: .trailing, multiplier: 1.0, constant: -100.5)
            cell.addConstraints([leadingConstraint, trailingConstraint])
        }
        
        cell.index = indexPath.row
        cell.fullResume = arrayOfResumes[indexPath.row]
        
        let node: Node = Node()
        let aResume = arrayOfResumes[indexPath.row]
        
        
        let url = Bundle.main.url(forResource: "master", withExtension: "html")
        
        node.setFirstName(name: aResume.basicInfo.fullName)
        node.setEmail(email: aResume.basicInfo.email)
        node.setNumber(number: aResume.basicInfo.phoneNumber)
        node.setObjective(objective: aResume.objective)
        
        var workCount = 0
        for work in aResume.arrayOfWorks{
            if workCount == 0{
                node.addWorkExperience(company: work.companyName, position: work.jobTitle, date: work.startDate + " - " + work.endDate, sub: work.description, isFirst: true)
            } else {
                node.addWorkExperience(company: work.companyName, position: work.jobTitle, date: work.startDate + " - " + work.endDate, sub: work.description, isFirst: false)
            }
            
            workCount += 1
        }
        var schoolCount = 0
        for school in aResume.arrayOfSchools{
            if schoolCount == 0{
                node.addInstitution(institution: school.schoolName, date: school.startDate + " - " + school.endDate , degree: school.areaOfStudy, skillSet: school.degree, isFirst: true)
            } else {
                node.addInstitution(institution: school.schoolName, date: school.startDate + " - " + school.endDate , degree: school.areaOfStudy, skillSet: school.degree, isFirst: false)
            }
           schoolCount += 1
        }
        var skillCount = 0
        for skill in aResume.skills{
            if skillCount == 0{
                node.addSkill(aSkill: skill, isFirst: true)
            } else {
                node.addSkill(aSkill: skill, isFirst: false)
            }
            
            skillCount += 1
        }
        node.setCSS(css: aResume.index)
        
        cell.webView.loadHTMLString(node.combinedHTML, baseURL: url)
        
        //let request = URLRequest(url: url!)
        //cell.webView.loadFileURL(url!, allowingReadAccessTo: url!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 475.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfResumes.count + 1
    }
    
    func triggerIt() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "selectTemplate") as! SelectATemplateViewController
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func editSelected(fullResume: FullResume, index: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "selectTemplate") as! SelectATemplateViewController
        vc.fullResume = fullResume
        vc.isEdit = true
        vc.editIndex = index
        
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func exportSelected(fullResume: FullResume, webView: WKWebView){
        let alertMenu = UIAlertController(title: "Export Your Resume", message: "Enter a unique name for this resume.", preferredStyle: .alert)
        
        alertMenu.addTextField(configurationHandler:  { (textField: UITextField!) -> Void in
            textField.placeholder = "Steve Jobs Resume"
        })
        let submitAction = UIAlertAction(title: "Save", style: .default){ _ in
            let firstTextField = alertMenu.textFields![0] as! UITextField
            self.fileName = firstTextField.text!
            
            let fileFinishedMenu = UIAlertController(title: "Resume Successfully Saved", message: "View your resume in your files app (Files > On My iPhone > Worthy)", preferredStyle: .alert)
            
            let doneAction = UIAlertAction(title: "Awesome!", style: .cancel){ _ in
            }
            
            fileFinishedMenu.addAction(doneAction)
            self.savePDFToiPhone(webView: webView)
            self.present(fileFinishedMenu, animated: true, completion: nil)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            
        }
        alertMenu.addAction(submitAction)
        alertMenu.addAction(cancelAction)
        
        self.present(alertMenu, animated: true, completion:nil)
    }
    
    func savePDFToiPhone(webView: WKWebView){
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
    
    func miscSelected(index: Int){
        
        let optionMenu = UIAlertController(title: "More Options", message: "Select from one of the options below", preferredStyle: .actionSheet)
    
        let duplicateAction = UIAlertAction(title: "Duplicate", style: .default) { _ in
            self.duplicateStuff(index: index)
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.deleteingStuff(index: index)
        }
    
        
         //let saveAction = UIAlertAction(title: "Save", style: .default)
         
         
         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
         
         
        optionMenu.addAction(deleteAction)
         //optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(duplicateAction)
         
         self.present(optionMenu, animated: true, completion: nil)

    }
    
    func deleteingStuff(index: Int){
        
         let optionMenu = UIAlertController(title: "Delete Resume", message: "Are you sure you want to delete this resume?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive){ _ in
            self.coreDataHelper.deleteResume(index: index)
            self.arrayOfResumes.remove(at: index)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(deleteAction)
        
        
        self.present(optionMenu, animated: true, completion: nil)
        
    }
    
    func duplicateStuff(index: Int){
        let object = arrayOfResumes[index]
        arrayOfResumes.append(object)
        coreDataHelper.saveFullResume(fullResume: object)
        tableView.reloadData()
    }
}
