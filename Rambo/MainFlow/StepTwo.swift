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
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var objectiveSummary: UITextField!
    var aDelegate: StepTwoDelegate!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func next(_ sender: Any) {
        if checkUse() {
            aDelegate.nextOne()
        } else {
            aDelegate.stepTwoAlert()
        }
        
    }
    
    func checkUse() -> Bool{
        if textView.text.count > 0{
            return true
        }
        return false
    }
    
}
