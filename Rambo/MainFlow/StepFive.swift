//
//  StepFive.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/5/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit


protocol StepFiveDelegate{
    func timeToExport()
}
class StepFive: UIView {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continue5: UIButton!
    @IBOutlet weak var ctaBox5: UIView!
    @IBOutlet weak var skillField: UITextField!
    
    var skills: [String] = []
    var aDelegate: StepFiveDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    @IBAction func continueExport(_ sender: Any) {
        aDelegate!.timeToExport()
    }
    
    override func awakeFromNib() {
        skillField.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "AddSkillTableViewCell", bundle: bundle)
        self.tableView.register(nib, forCellReuseIdentifier: "theCell")
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //fatalError("init(coder:) has not been implemented")
    }
    @IBAction func addSkill(_ sender: Any) {
        skills.append(skillField.text!)
        tableView.reloadData()
    }
    
    func checkUse() -> Bool{
        if skills.count > 1 {
            return true
        }
        
        return false
    }
    
}


extension StepFive: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell") as! AddSkillTableViewCell
        cell.skillLabel.text = self.skills[indexPath.row]
        
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true 
    }
    
}


