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
}
class StepOne: UIView {

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var link: UITextField!
    var aDelegate: StepOneDelegate!
    @IBOutlet weak var continue1: UIButton!
    
    
    
    @IBAction func next(_ sender: Any) {
        if checkUse(){
            aDelegate.goNext()
        }else{
            aDelegate.stepOneAlert()
        }
    }
    
    func checkUse() -> Bool{
        if fullName.text!.count > 0 && email.text!.count > 0 && phoneNumber.text!.count > 0{
            return true
        }
        return false
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
