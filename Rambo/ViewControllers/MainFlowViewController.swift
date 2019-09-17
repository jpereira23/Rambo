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
    var anIndex: Int = 0
    
    var dateAlert: UIAlertController!
    var fullResume: FullResume!
    var isEdit: Bool = false
    var editIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .fullScreen
        stepOne.aDelegate = self
        stepTwo.aDelegate = self
        stepThree.aDelegate = self
        stepFour.aDelegate = self
        stepFive.aDelegate = self
//        if #available(iOS 13.0, *) {
//            self.preferredUserInterfaceStyle = .light
//        } else {
//            // Fallback on earlier versions
//        }
    
        aMainNavBar.aDelegate = self
        
        
        
        //buttons
//        stepOne.continue1.layer.cornerRadius = 5.0
        stepOne.ctaBox1.layer.shadowOffset = CGSize(width: 0, height: -5)
        stepOne.ctaBox1.layer.shadowOpacity = 0.07
        stepOne.ctaBox1.layer.shadowRadius = 4.0
        stepOne.ctaBox1.layer.masksToBounds = false
        stepOne.ctaBox1.layer.cornerRadius = 5.0
        
//        stepTwo.continue2.layer.cornerRadius = 5.0
        stepTwo.ctaBox2.layer.shadowColor = UIColor.black.cgColor
        stepTwo.ctaBox2.layer.shadowOffset = CGSize(width: 0, height: -5)
        stepTwo.ctaBox2.layer.shadowOpacity = 0.07
        stepTwo.ctaBox2.layer.shadowRadius = 4.0
        stepTwo.ctaBox2.layer.masksToBounds = false
        
//        stepThree.continue3.layer.cornerRadius = 5.0
        stepThree.ctaBox3.layer.shadowColor = UIColor.black.cgColor
        stepThree.ctaBox3.layer.shadowOffset = CGSize(width: 0, height: -5)
        stepThree.ctaBox3.layer.shadowOpacity = 0.07
        stepThree.ctaBox3.layer.shadowRadius = 4.0
        stepThree.ctaBox3.layer.masksToBounds = false
        
//        stepFour.continue4.layer.cornerRadius = 5.0
        stepFour.ctaBox4.layer.shadowColor = UIColor.black.cgColor
        stepFour.ctaBox4.layer.shadowOffset = CGSize(width: 0, height: -5)
        stepFour.ctaBox4.layer.shadowOpacity = 0.07
        stepFour.ctaBox4.layer.shadowRadius = 4.0
        stepFour.ctaBox4.layer.masksToBounds = false
        
//        stepFive.continue5.layer.cornerRadius = 5.0
        stepFive.ctaBox5.layer.shadowColor = UIColor.black.cgColor
        stepFive.ctaBox5.layer.shadowOffset = CGSize(width: 0, height: -5)
        stepFive.ctaBox5.layer.shadowOpacity = 0.07
        stepFive.ctaBox5.layer.shadowRadius = 4.0
        stepFive.ctaBox5.layer.masksToBounds = false
    
        stepFive.addSkill.layer.cornerRadius = 5.0
        
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
        
        
        stepOne.tag = 1
        stepTwo.tag = 2
        stepThree.tag = 3
        stepFour.tag = 4
        stepFive.tag = 5
        theView.addSubview(stepFive)
        theView.addSubview(stepFour)
        theView.addSubview(stepThree)
        theView.addSubview(stepTwo)
        theView.addSubview(stepOne)
        
        if fullResume != nil {
            stepOne.fullName.text = fullResume.basicInfo.fullName
            stepOne.email.text = fullResume.basicInfo.email
            stepOne.phoneNumber.text = fullResume.basicInfo.phoneNumber
            stepOne.link.text = fullResume.basicInfo.link
            
            stepTwo.textView.text = fullResume.objective
            stepTwo.textView.viewWithTag(100)!.isHidden = true 
            
            stepThree.arrayOfWorks = fullResume.arrayOfWorks
            
            stepFour.arrayOfSchools = fullResume.arrayOfSchools
            
            stepFive.skills = fullResume.skills
        }
        // Do any additional setup after loading the view.
    
    }
    
    func selectContact(){
        
        if stepOne.checkUse() {
            aMainNavBar.moveSlider(index: 0)
            if let zeView = self.theView.viewWithTag(1){
                self.theView.bringSubviewToFront(zeView)
                aView = 0
            }
        }
        
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
    
    
    
    func selectObjective() -> Bool{
        
        if stepOne.checkUse(){
            //self.aMainNavBar.buttonSelected(index: 1)
            self.aMainNavBar.moveSlider(index: 1)
        
            if let zeView = self.theView.viewWithTag(2){
                self.theView.bringSubviewToFront(zeView)
                aView = 1
            }
            return true
        }
        failed()
        return false
    
    }
    
    func selectWork(){
        if stepTwo.checkUse(){
            
            //self.aMainNavBar.buttonSelected(index: 2)
            aMainNavBar.moveSlider(index: 2)
            if let zeView = self.theView.viewWithTag(3){
                self.theView.bringSubviewToFront(zeView)
                aView = 2
            }
        } else {
            failed()
        }
    }
    
    func selectEducation(){
        if stepThree.checkUse()
        {
            //self.aMainNavBar.buttonSelected(index: 3)
            aMainNavBar.moveSlider(index: 3)
            if let zeView = self.theView.viewWithTag(4){
                self.theView.bringSubviewToFront(zeView)
                aView = 3
            }
        } else {
            failed()
        }
    }
    
    func selectSkill(){
        if stepFour.checkUse(){
            //self.aMainNavBar.buttonSelected(index: 4)
            aMainNavBar.moveSlider(index: 4)
            aMainNavBar.exportButton.isHidden = false
            if let zeView = self.theView.viewWithTag(5){
                self.theView.bringSubviewToFront(zeView)
                aView = 4
            }
        } else {
            failed()
        }
    }
    
    func compileInformation() -> FullResume{
        let basic: BasicInfo = BasicInfo(fN: stepOne.fullName.text!, e: stepOne.email.text!, pN: stepOne.phoneNumber.text!, l: stepOne.link.text!)
        let objective: String = stepTwo.textView.text! 
        let arrayOfWorks: [Work] = stepThree.arrayOfWorks
        let arrayOfSchools: [School] = stepFour.arrayOfSchools
        let skills: [String] = stepFive.skills
        fullResume = FullResume(bI: basic, o: objective, aW: arrayOfWorks, aS: arrayOfSchools, s: skills, i: anIndex)
        
        
        return fullResume
    }

}

extension MainFlowViewController: MainNavBarDelegate, StepOneDelegate, StepTwoDelegate, StepThreeDelegate, StepFourDelegate, StepFiveDelegate{
    func exportSelected() {
        let fullResume = compileInformation()
        let vc = storyboard?.instantiateViewController(withIdentifier: "exportView") as! ExportViewController
        if isEdit == true{
            NSLog("IS IT TRUE")
            vc.isEdit = true
            vc.editIndex = editIndex
        }
        vc.fullResume = fullResume
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    func contactWasSelected() {
        if aView != 0{
            selectContact()
        }
    }
    
    func objectiveWasSelected() {
        if aView != 1{
            NSLog("Jesus")
            selectObjective()
        }
    }
    
    func workWasSelected() {
        if aView != 2{
            NSLog("JJEFUCKINUS")
            selectWork()
        }
    }
    
    func educationWasSelected() {
        if aView != 3{
            selectEducation()
        }
    }
    
    func skillsWasSelected() {
        if aView != 4{
            selectSkill()
        }
    }
    
    func goNext() {
        self.aView += 1
        //self.aMainNavBar.buttonSelected(index: 1)
        self.selectObjective()
    }
    
    func nextOne(){
        self.aView += 1
        //self.aMainNavBar.buttonSelected(index: 2)
        self.selectWork()
    }
    
    func zeNextOne(){
        self.aView += 1
        //self.aMainNavBar.buttonSelected(index: 3)
        self.selectEducation()
    }
    
    func DANextOne(){
        self.aView += 1
        //self.aMainNavBar.buttonSelected(index: 4)
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
        let alert = UIAlertController(title: "Details Required", message: "Please enter your Full Name, Email,and Phone Number to continue.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func stepTwoAlert(){
        let alert = UIAlertController(title: "Details Required", message: "Please enter your Objective to continue.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func stepThreeAlertCell(){
        let alert = UIAlertController(title: "Details Required", message: "Please enter your Job Title, Company Name, Start Date, End Date and City to continue.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func stepFourAlertCell(){
        let alert = UIAlertController(title: "Details Required", message: "Please enter your School Name, Degree, Area of Study, Start Date, End Date and City to continue.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func timeToExport() {
        let fullResume = compileInformation()
        let vc = storyboard?.instantiateViewController(withIdentifier: "exportView") as! ExportViewController
        if isEdit == true{
            vc.isEdit = true
            vc.editIndex = editIndex
        }
        vc.fullResume = fullResume
        self.present(vc, animated: true, completion: nil)
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
