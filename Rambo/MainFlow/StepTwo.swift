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
        //add textview font-size and fon-family
    }
    
    func checkUse() -> Bool{
        if textView.text.count > 0{
            return true
        }
        return false
    }
    
}
