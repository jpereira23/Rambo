//
//  AddWorkTableViewCell.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/8/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class AddWorkTableViewCell: UITableViewCell, DateKeyboardDelegate {
    @IBOutlet weak var jobTitle: UITextField!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var isEmployed: UISwitch!
    @IBOutlet weak var CITY: UITextField!
    @IBOutlet weak var aDescription: UITextView!
    
    var isStart: Bool = false
    var isEnd: Bool = false
    
    let keyboardView = DateKeyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        startDate.addTarget(self, action: #selector(startDateSelected), for: .editingDidBegin)
        endDate.addTarget(self, action: #selector(endDateSelected), for: .editingDidBegin)
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
