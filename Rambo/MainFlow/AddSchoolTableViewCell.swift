//
//  AddSchoolTableViewCell.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/8/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit


protocol AddSchoolTableViewCellDelegate{
    func addStartDate(index: Int)
}
class AddSchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var schoolName: UITextField!
    @IBOutlet weak var degree: UITextField!
    @IBOutlet weak var areaOfStudy: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var isEmployee: UISwitch!
    var aDelegate: AddSchoolTableViewCellDelegate!
    var index: Int! 
    override func awakeFromNib() {
        super.awakeFromNib()
        startDate.addTarget(self, action: #selector(startDateSelected), for: .editingDidBegin)
       
    }
    
    @objc func startDateSelected(textField: UITextField){
        aDelegate.addStartDate(index: index)
    }
    
    func checkUse() -> Bool {
        if schoolName.text!.count > 0 && degree.text!.count > 0 && areaOfStudy.text!.count > 0 && startDate.text!.count > 0 && endDate.text!.count > 0 && city.text!.count > 0 {
            return true
        }
        
        return false
    }
    
    func printSomething(text: String){
        startDate.text = text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
