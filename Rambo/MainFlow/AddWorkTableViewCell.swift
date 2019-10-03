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
    func deleteCell(index: Int)
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
    @IBOutlet weak var deleteButton: UIButton!
    
    
    var aDelegate: AddWorkTableViewCellDelegate?
    var isStart: Bool = false
    var isEnd: Bool = false
    var index: Int!
    let aLabel = UILabel()
    
    let keyboardViewStart = DateKeyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
    let keyboardViewEnd = DateKeyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
    override func awakeFromNib() {
        //super.awakeFromNib()
        // Initialization code
        //self.startDate.text = "FUCK YOU"
        isEmployed.isOn = true
        NSLog("startDate.text = \(startDate.text)")
        //self.endDate.text = "Present"
        //endDate.isEnabled = false
        
        
        jobTitle.delegate = self
        companyName.delegate = self
        startDate.delegate = self
        //endDate.delegate = self
        CITY.delegate = self
        aDescription.placeholder = "Please place description here."
        aDescription.delegate = self
        
        jobTitle.autocapitalizationType = .words
        companyName.autocapitalizationType = .words
        CITY.autocapitalizationType = .words
        aDescription.autocapitalizationType = .sentences
        
        startDate.addTarget(self, action: #selector(startDateSelected), for: .editingDidBegin)
        endDate.addTarget(self, action: #selector(endDateSelected), for: .editingDidBegin)
        isEmployed.addTarget(self, action: #selector(employedSelected), for: .valueChanged)
        
        
        
        var aYearStart = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: NSDate() as Date)
        var aYearEnd = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: NSDate() as Date)
        keyboardViewStart.datePicker.aYear = (aYearStart)
        keyboardViewStart.datePicker.commonSetup()
        keyboardViewEnd.datePicker.aYear = (aYearEnd)
        keyboardViewEnd.datePicker.commonSetup()
        startDate.inputView = keyboardViewStart
        
        endDate.inputView = keyboardViewEnd
        
        keyboardViewStart.delegate = self
        keyboardViewEnd.delegate = self
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
            endDate.placeholder = "08/2016"
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
        
 
        let doneToolbar3: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar3.barStyle = .default
        
        let flexSpace3 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done3: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction3))
        let cancel3: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelButtonAction3))
        done3.tintColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        cancel3.tintColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        let items3 = [cancel3, flexSpace3, done3]
        doneToolbar3.items = items3
        doneToolbar3.sizeToFit()
        
        endDate.inputAccessoryView = doneToolbar3
        
        let doneToolbar4: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar4.barStyle = .default
        
        let flexSpace4 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done4: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction4))
        let cancel4: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelButtonAction4))
        done4.tintColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        cancel4.tintColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        let items4 = [cancel4, flexSpace4, done4]
        doneToolbar4.items = items4
        doneToolbar4.sizeToFit()
        
        startDate.inputAccessoryView = doneToolbar4
    }
    
    @objc func doneButtonAction3(){
        keyboardViewEnd.getData()
        endDate.resignFirstResponder()
    }
    
    @objc func cancelButtonAction3(){
        endDate.resignFirstResponder()
    }
    
    @objc func doneButtonAction4(){
        keyboardViewStart.getData()
        startDate.resignFirstResponder()
    }
    
    @objc func cancelButtonAction4(){
        startDate.resignFirstResponder()
    }
    
    @objc func linkDoneButtonAction(){
        aDescription.resignFirstResponder()
    }
    
    @IBAction func deleteWork(_ sender: Any) {
        aDelegate?.deleteCell(index: index)
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
            
            startDate.inputView = keyboardViewStart
            keyboardViewEnd.datePicker.aYear = keyboardViewStart.datePicker.year
            keyboardViewEnd.datePicker.commonSetup1()
            endDate.inputView = keyboardViewEnd
        }
        
        if isEnd{
            endDate.text = date
            endDate.inputView = nil
            endDate.reloadInputViews()
            endDate.endEditing(true)
            isEnd = false
            
            endDate.inputView = keyboardViewEnd
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
