//
//  StepOne.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/5/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
protocol StepOneDelegate{
    func goNext()
    func stepOneAlert()
    func emailDontWork()
    func phoneNumberDontWork()
}
class StepOne: UIView, UITextFieldDelegate{

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var link: UITextField!
    var aDelegate: StepOneDelegate!
    @IBOutlet weak var continue1: UIButton!
    @IBOutlet weak var ctaBox1: UIView!
    
    
    
    @IBAction func next(_ sender: Any) {
        if checkUse() {
            aDelegate.goNext()
        } else {
            aDelegate.stepOneAlert()
        }
    }
    
    func checkUse() -> Bool{
        /**
        if !checkPhone(){
            aDelegate.phoneNumberDontWork()
            return false
        }
        if !checkEmail(){
            aDelegate.emailDontWork()
            return false
        }
        **/
        if fullName.text!.count > 0 && email.text!.count > 0 && phoneNumber.text!.count > 0{
            return true
        }
        return false
    }
    
    override func awakeFromNib() {
        phoneNumber.delegate = self
    }
    
    func checkEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email.text)
    }
    
    func checkPhone() -> Bool{
        /*
 
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with:phoneNumber.text)
        */
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        var aString: String! = phoneNumber!.text
        let isBackspace: Int32! = strcmp(string.cString(using: String.Encoding.utf8), "\\b")
        
        NSLog("\(aString.count)")
        if aString.count == 3 && isBackspace != -92{
            let index = aString.index(aString.startIndex, offsetBy: 3)
            aString.insert("-", at: index)
            
            
            phoneNumber.text = aString
        }
        
        if aString.count == 12 && aString.contains("("){
            if (isBackspace == -92){
                let index = aString.index(aString.startIndex, offsetBy: 9)
                aString.remove(at:index)
                
                let index1 = aString.index(aString.startIndex, offsetBy: 4)
                aString.remove(at: index1)
                
                aString.remove(at: index1)
                
                let index2 = aString.index(aString.startIndex, offsetBy: 0)
                aString.remove(at: index2)
                
                let index3 = aString.index(aString.startIndex, offsetBy: 3)
                aString.insert("-", at: index3)
                
                phoneNumber.text = aString
            }
        }else if aString.count == 8 && isBackspace != -92{
            
            let index = aString.index(aString.startIndex, offsetBy: 0)
            aString.insert("(", at: index)
            let index1 = aString.index(aString.startIndex, offsetBy: 4)
            aString.insert(")", at: index1)
            
            let index2 = aString.index(aString.startIndex, offsetBy: 5)
            aString.remove(at: index2)
            
            aString.insert(" ", at: index2)
            
            let index3 = aString.index(aString.startIndex, offsetBy: 9)
            aString.insert("-", at: index3)
            
            phoneNumber.text = aString
        }
        
        
        
        
        return true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
