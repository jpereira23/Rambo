//
//  MainViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/19/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{

    @IBOutlet var buildNew: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var accountLabel: UILabel!
    let coreDataHelper: CoreDataHelper = CoreDataHelper()
    var isSignedIn: Bool = false
    var arrayOfResumes: [FullResume] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if #available(iOS 13.0, *) {
////            preferredUserInterfaceStyle = .light
//        } else {
//            // Fallback on earlier versions
//        }
        //coreDataHelper.resetCoreData()
        buildNew.layer.cornerRadius = 5.0
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ThirdWayTableViewCell", bundle: bundle)
        self.tableView.register(nib, forCellReuseIdentifier: "cellBitch")
        
        arrayOfResumes = coreDataHelper.loadFullResume()
        
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
        
        cell.index = indexPath.row
        cell.fullResume = arrayOfResumes[indexPath.row]
        
        let node: Node = Node()
        let aResume = arrayOfResumes[indexPath.row]
        
        
        let url = Bundle.main.url(forResource: "resume", withExtension: "html")
        
        node.setFirstName(name: aResume.basicInfo.fullName)
        node.setEmail(email: aResume.basicInfo.email)
        node.setNumber(number: aResume.basicInfo.phoneNumber)
        node.setObjective(objective: aResume.objective)
        for work in aResume.arrayOfWorks{
            node.addWorkExperience(company: work.companyName, date: work.startDate + " - " + work.endDate, sub: work.jobTitle)
        }
        
        for school in aResume.arrayOfSchools{
            node.addInstitution(institution: school.schoolName, date: school.startDate + " - " + school.endDate, degree: school.areaOfStudy)
        }
        
        for skill in aResume.skills{
            node.addSkill(skill: skill)
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
    
    func editSelected(fullResume: FullResume) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "selectTemplate") as! SelectATemplateViewController
        vc.fullResume = fullResume
        vc.isEdit = true
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func exportSelected(fullResume: FullResume){
        let vc = storyboard?.instantiateViewController(withIdentifier: "exportView") as! ExportViewController
        vc.fullResume = fullResume
        self.present(vc, animated: true, completion: nil)
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
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
        
    }
    
    func duplicateStuff(index: Int){
        let object = arrayOfResumes[index]
        arrayOfResumes.append(object)
        coreDataHelper.saveFullResume(fullResume: object)
        tableView.reloadData()
    }
}
