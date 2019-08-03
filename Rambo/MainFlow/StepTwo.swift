//
//  StepTwo.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/5/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

protocol StepTwoDelegate{
    func nextOne()
    func stepTwoAlert()
}
class StepTwo: UIView {

    @IBOutlet weak var continue2: UIButton!
    @IBOutlet weak var ctaBox2: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var objectiveSummary: UITextField!
    var aDelegate: StepTwoDelegate!
    
    @IBAction func next(_ sender: Any) {
        if checkUse() {
            aDelegate.nextOne()
        } else {
            aDelegate.stepTwoAlert()
        }
        
    }
    
    override func awakeFromNib() {
        textView.placeholder = "I am a results-driven contributor who doesn’t mind working out the details to deliver quality work to clients."
        addDoneButton()
        //add textview font-size and fon-family
    }
    
    func addDoneButton(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
         done.tintColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        let theItems = [flexSpace, done]
        doneToolbar.items = theItems
        doneToolbar.sizeToFit()
        
        textView.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        textView.resignFirstResponder()
    }
    
    func checkUse() -> Bool{
        if textView.text.count > 0{
            return true
        }
        return false
    }
    
}
