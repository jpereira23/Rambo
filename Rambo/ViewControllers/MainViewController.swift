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
        
        
        //coreDataHelper.resetCoreData()
        buildNew.layer.cornerRadius = 5
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
        
        let node: Node = Node()
        let aResume = arrayOfResumes[indexPath.row]
        
        
        let url = Bundle.main.url(forResource: "resume", withExtension: "html")
        
        node.setFirstName(name: aResume.basicInfo.fullName)
        node.setEmail(email: aResume.basicInfo.email)
        node.setNumber(number: aResume.basicInfo.phoneNumber)
        node.setObjective(objective: aResume.objective)
        for work in aResume.arrayOfWorks{
            node.addWorkExperience(company: work.companyName, date: "9/7/2019", sub: work.jobTitle)
        }
        
        for school in aResume.arrayOfSchools{
            node.addInstitution(institution: school.schoolName, date: "9/7/2019", degree: school.areaOfStudy)
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
    
    func editSelected() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainFlow") as! MainFlowViewController
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func exportSelected(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "exportView") as! ExportViewController
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func miscSelected(){
        
         let optionMenu = UIAlertController(title: "Are you sure you want to delete?", message: "If you delete, this action cannot be undone.", preferredStyle: .actionSheet)
         
         let deleteAction = UIAlertAction(title: "Delete", style: .destructive)
         //let saveAction = UIAlertAction(title: "Save", style: .default)
         
         
         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
         
         
         optionMenu.addAction(deleteAction)
         //optionMenu.addAction(saveAction)
         optionMenu.addAction(cancelAction)
         
         self.present(optionMenu, animated: true, completion: nil)

    }
}
