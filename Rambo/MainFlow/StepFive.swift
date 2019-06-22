//
//  StepFive.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/5/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class StepFive: UIView {
    
    var skills: [String] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continue5: UIButton!
    @IBOutlet weak var skillField: UITextField!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    override func awakeFromNib() {
        NSLog("Are we getting here")
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


extension StepFive: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell") as! AddSkillTableViewCell
        cell.skillLabel.text = self.skills[indexPath.row]
        
        return cell
    }
}
