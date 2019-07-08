//
//  AddWorkTableViewCell.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/8/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit


protocol AddWorkTableViewCellDelegate{
    func editingBegan(y: Int)
}
class AddWorkTableViewCell: UITableViewCell, DateKeyboardDelegate {
    @IBOutlet weak var jobTitle: UITextField!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var isEmployed: UISwitch!
    @IBOutlet weak var CITY: UITextField!
    @IBOutlet weak var aDescription: UITextView!
    @IBOutlet weak var jobTitleStack: UIStackView!
    @IBOutlet weak var companyNameStack: UIStackView!
    @IBOutlet weak var startDateStack: UIStackView!
    @IBOutlet weak var endDateStack: UIStackView!
    @IBOutlet weak var cityStack: UIStackView!
    
    
    var aDelegate: AddWorkTableViewCellDelegate?
    var isStart: Bool = false
    var isEnd: Bool = false
    var index: Int!
    
    let keyboardView = DateKeyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        isEmployed.isOn = true
        endDate.text = "Present"
        endDate.isEnabled = false
        jobTitle.delegate = self
        companyName.delegate = self
        startDate.delegate = self
        endDate.delegate = self
        CITY.delegate = self
        
        startDate.addTarget(self, action: #selector(startDateSelected), for: .editingDidBegin)
        endDate.addTarget(self, action: #selector(endDateSelected), for: .editingDidBegin)
        isEmployed.addTarget(self, action: #selector(employedSelected), for: .valueChanged)
        
        startDate.inputView = keyboardView
        endDate.inputView = keyboardView
        keyboardView.delegate = self
    }
    
    @objc func startDateSelected(textField: UITextField){
        isStart = true
    }
    
    @objc func endDateSelected(textField: UITextField){
        isEnd = true
    }
    
    @objc func employedSelected(){
        if isEmployed.isOn {
            endDate.text = "Present"
            endDate.isEnabled = false
        } else {
            endDate.text = ""
            endDate.isEnabled = true
        }
    }
    
    func checkUse() -> Bool{
        if jobTitle.text!.count > 0 && companyName.text!.count > 0 && startDate.text!.count > 0 && endDate.text!.count > 0 && CITY.text!.count > 0 && aDescription.text!.count > 0{
            return true
        }
        
        return false
    }
    
    func keyWasTapped(date: String) {
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension AddWorkTableViewCell: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        var aPoint = CGPoint(x: 0, y: 20)
        
        if textField == self.companyName{
            aPoint.y = self.companyNameStack.frame.origin.y
        }
        
        if textField == self.startDate{
            aPoint.y = self.startDateStack.frame.origin.y
        }
        
        if textField == self.endDate{
            aPoint.y = self.endDateStack.frame.origin.y
        }
        
        if textField == self.CITY{
            aPoint.y = self.cityStack.frame.origin.y
        }
        
        aPoint.y = CGFloat(Int(aPoint.y) + (self.index * Int(self.frame.height)))
        self.aDelegate?.editingBegan(y: Int(aPoint.y))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
