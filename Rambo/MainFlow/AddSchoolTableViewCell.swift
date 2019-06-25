//
//  AddSchoolTableViewCell.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/8/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit


protocol AddSchoolTableViewCellDelegate{
}
class AddSchoolTableViewCell: UITableViewCell, DateKeyboardDelegate {

    @IBOutlet weak var schoolName: UITextField!
    @IBOutlet weak var degree: UITextField!
    @IBOutlet weak var areaOfStudy: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var isEmployee: UISwitch!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var country: UITextField!
    
    let keyboardView = DateKeyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
    var aDelegate: AddSchoolTableViewCellDelegate!
    var index: Int!
    var isStart: Bool = false
    var isEnd: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Intialization code
        isEmployee.isOn = true
        endDate.text = "Present"
        endDate.isEnabled = false
        
        startDate.addTarget(self, action: #selector(startDateSelected), for: .editingDidBegin)
        endDate.addTarget(self, action: #selector(endDateSelected), for: .editingDidBegin)
        
        isEmployee.addTarget(self, action: #selector(employedSelected), for: .valueChanged)
        startDate.inputView = keyboardView
        endDate.inputView = keyboardView
        keyboardView.delegate = self
    }
    
    @objc func countryStartEditing(textField: UITextField){
        NSLog(country.text!)
    }
    
    @objc func startDateSelected(textField: UITextField){
        isStart = true
    }
    
    @objc func endDateSelected(textField: UITextField){
        isEnd = true
    }
    
    @objc func employedSelected(){
        if isEmployee.isOn {
            endDate.text = "Present"
            endDate.isEnabled = false
        } else {
            endDate.text = ""
            endDate.isEnabled = true
        }
    }
    
    func keyWasTapped(date: String) {
        NSLog(date)
        if isStart{
            startDate.text = date
            startDate.inputView = nil
            startDate.reloadInputViews()
            startDate.endEditing(true)
            isStart = false
        }
        
        if isEnd{
            endDate.text = date
            endDate.inputView = nil
            endDate.reloadInputViews()
            endDate.endEditing(true)
            isEnd = false
        }
        
    }
    
    func checkUse() -> Bool {
        if schoolName.text!.count > 0 && degree.text!.count > 0 && areaOfStudy.text!.count > 0 && startDate.text!.count > 0 && endDate.text!.count > 0 && city.text!.count > 0 {
            return true
        }
        
        return false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
