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
    @IBOutlet weak var descriptionStack: UIStackView!
    
    
    var aDelegate: AddWorkTableViewCellDelegate?
    var isStart: Bool = false
    var isEnd: Bool = false
    var index: Int!
    let aLabel = UILabel()
    
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
        
        aDescription.placeholder = "Please place description here."
        aDescription.delegate = self
        
        var aYear = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: NSDate() as Date)
        keyboardView.datePicker.aYear = (aYear)
        keyboardView.datePicker.commonSetup()
        startDate.inputView = keyboardView
        endDate.inputView = keyboardView
        keyboardView.delegate = self
        
        self.addDoneButton()
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
    
    func addDoneButton(){
        let aDoneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        aDoneToolbar.barStyle = .default
        
        let aFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let aDone: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.linkDoneButtonAction))
        
        aLabel.text = aDescription.text
        aLabel.frame = CGRect(x: 20, y: 20, width: 200, height: 50)
        aLabel.textColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        let aLabelAsBarButton = UIBarButtonItem(customView: aLabel)
        aDone.tintColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        let theItems = [aLabelAsBarButton, aFlexSpace, aDone]
        aDoneToolbar.items = theItems
        aDoneToolbar.sizeToFit()
        
        aDescription.inputAccessoryView = aDoneToolbar
    }
    
    @objc func linkDoneButtonAction(){
        aDescription.resignFirstResponder()
    }
    
    func checkUse() -> Bool{
        
        if jobTitle.text!.count > 0 && companyName.text!.count > 0 && startDate.text!.count > 0 && CITY.text!.count > 0 && aDescription.text!.count > 0{
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
            
            startDate.inputView = keyboardView
            keyboardView.datePicker.aYear = keyboardView.datePicker.year
            keyboardView.datePicker.commonSetup1()
            endDate.inputView = keyboardView
        }
        
        if isEnd{
            endDate.text = date
            endDate.inputView = nil
            endDate.reloadInputViews()
            endDate.endEditing(true)
            isEnd = false
            
            endDate.inputView = keyboardView
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension AddWorkTableViewCell: UITextFieldDelegate, UITextViewDelegate{
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        var aPoint = CGPoint(x: 0, y: 20)
        
        aPoint.y = self.descriptionStack.frame.origin.y
        
        aPoint.y = CGFloat(Int(aPoint.y) + (self.index * Int(self.frame.height)))
        self.aDelegate?.editingBegan(y: Int(aPoint.y))
        self.aDescription.viewWithTag(100)!.isHidden = true
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n"){
            self.resignFirstResponder()
        }
        return true
    }
    
    
}
