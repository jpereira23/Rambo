//
//  MainFlowViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/5/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class MainFlowViewController: UIViewController {
    

    @IBOutlet weak var mainNavBar: UIView!
    @IBOutlet weak var theView: UIView!
    let aMainNavBar: MainNavBar = Bundle.main.loadNibNamed("MainNavBar", owner: self, options: nil)?.first as! MainNavBar
    let stepOne: StepOne = Bundle.main.loadNibNamed("StepOne", owner: self, options: nil)?.first as! StepOne
    let stepTwo: StepTwo = Bundle.main.loadNibNamed("StepTwo", owner: self, options: nil)?.first as! StepTwo
    let stepThree: StepThree = Bundle.main.loadNibNamed("StepThree", owner: self, options: nil)?.first as! StepThree
    
    let stepFour: StepFour = Bundle.main.loadNibNamed("StepFour", owner: self, options: nil)?.first as! StepFour
    
    let stepFive: StepFive = Bundle.main.loadNibNamed("StepFive", owner: self, options: nil)?.first as! StepFive
    
    var aView: Int = 0
    var datePicker: UIDatePicker = UIDatePicker()
    let toolbar = UIToolbar()
    
    var dateAlert: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        stepOne.aDelegate = self
        stepTwo.aDelegate = self
        stepThree.aDelegate = self
        stepFour.aDelegate = self
    
        aMainNavBar.aDelegate = self
        
        
        //rounded buttons
        stepOne.continue1.layer.cornerRadius = 5
//        stepOne.continue1.layer.shadowColor = UIColor.lightGray.cgColor
//        stepOne.continue1.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        stepOne.continue1.layer.shadowOpacity = 0.5
//        stepOne.continue1.layer.shadowRadius = 3
        stepTwo.continue2.layer.cornerRadius = 5
        stepThree.continue3.layer.cornerRadius = 5
        stepFour.continue4.layer.cornerRadius = 5
        stepFive.continue5.layer.cornerRadius = 5
        
        //TextFields Inside Padding
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        stepOne.fullName.leftView = indentView
        stepOne.fullName.leftViewMode = .always
        
        let indentView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        stepOne.email.leftView = indentView2
        stepOne.email.leftViewMode = .always
        
        let indentView3 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        stepOne.phoneNumber.leftView = indentView3
        stepOne.phoneNumber.leftViewMode = .always
        
        let indentView4 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        stepOne.link.leftView = indentView4
        stepOne.link.leftViewMode = .always
        
        
        mainNavBar.addSubview(aMainNavBar)
        
        
        
        
        theView.addSubview(stepFive)
        theView.addSubview(stepFour)
        theView.addSubview(stepThree)
        theView.addSubview(stepTwo)
        theView.addSubview(stepOne)
        // Do any additional setup after loading the view.
    
    }
    
    func selectContact(){
        checkUse()
        self.theView.bringSubviewToFront(self.theView.subviews[4])
        aView = 0
    }
    
    func failed(){
        switch(aView){
        case 0:
            stepOne.aDelegate.stepOneAlert()
            break
        case 1:
            stepTwo.aDelegate.stepTwoAlert()
            break
        case 2:
            stepThree.aDelegate.stepThreeAlertCell()
            break
        case 3:
            stepFour.aDelegate.stepFourAlertCell()
            break
        default:
            break
        }
    }
    
    func checkUse(){
        if stepOne.checkUse() {
            let image = UIImage(named: "contact-filled.png")
            aMainNavBar.contactButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "contact-empty.png")
            aMainNavBar.contactButton.setImage(image, for: .normal)
        }
        
        if stepTwo.checkUse(){
            NSLog("IT WORKED?")
            let image = UIImage(named: "objective-filled.png")
            aMainNavBar.objectiveButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "objective-empty.png")
            aMainNavBar.objectiveButton.setImage(image, for: .normal)
        }
        
        if stepThree.checkUse(){
            
            let image = UIImage(named: "work-filled.png")
            aMainNavBar.workButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "work-empty.png")
            aMainNavBar.workButton.setImage(image, for: .normal)
        }
        
        if stepFour.checkUse(){
            let image = UIImage(named: "education-filled.png")
            aMainNavBar.educationButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "education-empty.png")
            aMainNavBar.educationButton.setImage(image, for: .normal)
        }
        
        if stepFive.checkUse(){
            let image = UIImage(named: "skills-filled.png")
            aMainNavBar.skillsButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "skills-empty.png")
            aMainNavBar.skillsButton.setImage(image, for: .normal)
        }
    }
    
    func selectObjective(){
        
        //if stepOne.checkUse(){
            //checkUse()
            //NSLog("selectObjective")
        
            self.theView.bringSubviewToFront(self.theView.subviews[3])
            aView = 1
        //} else {
            //failed()
        //}
    
    }
    
    func selectWork(){
        //if stepTwo.checkUse(){
            //checkUse()
            self.theView.bringSubviewToFront(self.theView.subviews[2])
            aView = 2
        //} else {
            //failed()
        //}
    }
    
    func selectEducation(){
        //if stepThree.checkUse()
        //{
            //checkUse()
            self.theView.bringSubviewToFront(self.theView.subviews[1])
            aView = 3
        //} else {
            //failed()
        //}
    }
    
    func selectSkill(){
        //if stepFour.checkUse(){
            //checkUse()
            self.theView.bringSubviewToFront(self.theView.subviews[0])
            aView = 4
        //} else {
            //failed()
        //}
    }

}

extension MainFlowViewController: MainNavBarDelegate, StepOneDelegate, StepTwoDelegate, StepThreeDelegate, StepFourDelegate{
    
    
    func contactWasSelected() {
        if aView != 0{
            selectContact()
        }
        NSLog("contact was selected")
    }
    
    func objectiveWasSelected() {
        NSLog("objective was selected")
        if aView != 1{
            selectObjective()
        }
        
    }
    
    func workWasSelected() {
        
        if aView != 2{
            selectWork()
        }
        NSLog("work was selected")
    }
    
    func educationWasSelected() {
        
        if aView != 3{
            selectEducation()
        }
        NSLog("education was selected")
    }
    
    func skillsWasSelected() {
        
        if aView != 4{
            selectSkill()
        }
        NSLog("skills was selected")
    }
    
    func goNext() {
        self.aView += 1
        self.selectObjective()
    }
    
    func nextOne(){
        self.aView += 1
        self.selectWork()
    }
    
    func zeNextOne(){
        self.aView += 1
        self.selectEducation()
    }
    
    func DANextOne(){
        self.aView += 1
        self.selectSkill()
    }
    
    func emailDontWork(){
        let alert = UIAlertController(title: "Email is not valid.", message: "Please check that the email you have entered is a valid email.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func phoneNumberDontWork(){
        let alert = UIAlertController(title: "Phone Number is not valid.", message: "Please check that the phone number you have entered is a valid phone number.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func stepOneAlert(){
        let alert = UIAlertController(title: "Please provide info.", message: "Provide Email, Full Name and Phone Number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func stepTwoAlert(){
        let alert = UIAlertController(title: "Please provide info.", message: "Provide an Objective.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func stepThreeAlertCell(){
        let alert = UIAlertController(title: "Please provide work details.", message: "Provide an Job Title, Company Name, Start Date, End Date and City", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func stepFourAlertCell(){
        let alert = UIAlertController(title: "Please provide school details.", message: "Provide a School Name, Degree, Area of Study, Start Date, End Date and City", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
