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
        
        self.modalPresentationStyle = .fullScreen
        stepOne.aDelegate = self
        stepTwo.aDelegate = self
        stepThree.aDelegate = self
        stepFour.aDelegate = self
        stepFive.aDelegate = self
    
        aMainNavBar.aDelegate = self
        
        
        //mainNavBar.contactButton.setTitleColor(UIColor(red: 107.0/255.0, green: 199.0/255.0, blue: 217.0/255.0), forState: .normal)
        
        //buttons
        stepOne.continue1.layer.cornerRadius = 5
        stepOne.ctaBox1.layer.shadowOffset = CGSize(width: 0, height: -5)
        stepOne.ctaBox1.layer.shadowOpacity = 0.07
        stepOne.ctaBox1.layer.shadowRadius = 4.0
        stepOne.ctaBox1.layer.masksToBounds = false
        stepOne.ctaBox1.layer.cornerRadius = 5
        
        stepTwo.continue2.layer.cornerRadius = 5
        stepTwo.ctaBox2.layer.shadowColor = UIColor.black.cgColor
        stepTwo.ctaBox2.layer.shadowOffset = CGSize(width: 0, height: -5)
        stepTwo.ctaBox2.layer.shadowOpacity = 0.07
        stepTwo.ctaBox2.layer.shadowRadius = 4.0
        stepTwo.ctaBox2.layer.masksToBounds = false
        
        stepThree.continue3.layer.cornerRadius = 5
        stepThree.ctaBox3.layer.shadowColor = UIColor.black.cgColor
        stepThree.ctaBox3.layer.shadowOffset = CGSize(width: 0, height: -5)
        stepThree.ctaBox3.layer.shadowOpacity = 0.07
        stepThree.ctaBox3.layer.shadowRadius = 4.0
        stepThree.ctaBox3.layer.masksToBounds = false
        
        stepFour.continue4.layer.cornerRadius = 5
        stepFour.ctaBox4.layer.shadowColor = UIColor.black.cgColor
        stepFour.ctaBox4.layer.shadowOffset = CGSize(width: 0, height: -5)
        stepFour.ctaBox4.layer.shadowOpacity = 0.07
        stepFour.ctaBox4.layer.shadowRadius = 4.0
        stepFour.ctaBox4.layer.masksToBounds = false
        
        stepFive.continue5.layer.cornerRadius = 5
        stepFive.ctaBox5.layer.shadowColor = UIColor.black.cgColor
        stepFive.ctaBox5.layer.shadowOffset = CGSize(width: 0, height: -5)
        stepFive.ctaBox5.layer.shadowOpacity = 0.07
        stepFive.ctaBox5.layer.shadowRadius = 4.0
        stepFive.ctaBox5.layer.masksToBounds = false
        
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
        // Do any additional setup after loading the view.
    
    }
    
    func selectContact(){
        
        checkUse()
        
        if let zeView = self.theView.viewWithTag(1){
            self.theView.bringSubviewToFront(zeView)
            aView = 0
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
    
    func checkUse(){
        if stepOne.checkUse() {
            //let image = UIImage(named: "contact-filled.png")
            //aMainNavBar.contactButton.setImage(image, for: .normal)
        } else {
            //let image = UIImage(named: "contact-empty.png")
            //aMainNavBar.contactButton.setImage(image, for: .normal)
        }
        
        if stepTwo.checkUse(){
            NSLog("IT WORKED?")
            //let image = UIImage(named: "objective-filled.png")
            //aMainNavBar.objectiveButton.setImage(image, for: .normal)
        } else {
            //let image = UIImage(named: "objective-empty.png")
            //aMainNavBar.objectiveButton.setImage(image, for: .normal)
        }
        
        if stepThree.checkUse(){
            
            //let image = UIImage(named: "work-filled.png")
            //aMainNavBar.workButton.setImage(image, for: .normal)
        } else {
            //let image = UIImage(named: "work-empty.png")
            //aMainNavBar.workButton.setImage(image, for: .normal)
        }
        
        if stepFour.checkUse(){
            //let image = UIImage(named: "education-filled.png")
            //aMainNavBar.educationButton.setImage(image, for: .normal)
        } else {
            //let image = UIImage(named: "education-empty.png")
            //aMainNavBar.educationButton.setImage(image, for: .normal)
        }
        
        if stepFive.checkUse(){
            //let image = UIImage(named: "skills-filled.png")
            //aMainNavBar.skillsButton.setImage(image, for: .normal)
        } else {
            //let image = UIImage(named: "skills-empty.png")
            //aMainNavBar.skillsButton.setImage(image, for: .normal)
        }
    }
    
    func selectObjective(){
        NSLog("subview[0].tag = \(self.theView.subviews[0].tag)")
        NSLog("subview[1].tag = \(self.theView.subviews[1].tag)")
        NSLog("subview[2].tag = \(self.theView.subviews[2].tag)")
        NSLog("subview[3].tag = \(self.theView.subviews[3].tag)")
        //if stepOne.checkUse(){
            //checkUse()
            //NSLog("selectObjective")
        
            if let zeView = self.theView.viewWithTag(2){
                self.theView.bringSubviewToFront(zeView)
                aView = 1
            }
        //} else {
            //failed()
        //}
    
    }
    
    func selectWork(){
        //if stepTwo.checkUse(){
            //checkUse()
        if let zeView = self.theView.viewWithTag(3){
            self.theView.bringSubviewToFront(zeView)
            aView = 2
        }
        //} else {
            //failed()
        //}
    }
    
    func selectEducation(){
        //if stepThree.checkUse()
        //{
            //checkUse()
            if let zeView = self.theView.viewWithTag(4){
                self.theView.bringSubviewToFront(zeView)
                aView = 3
            }
        //} else {
            //failed()
        //}
    }
    
    func selectSkill(){
        //if stepFour.checkUse(){
            //checkUse()
            if let zeView = self.theView.viewWithTag(5){
                self.theView.bringSubviewToFront(zeView)
                aView = 4
            }
        //} else {
            //failed()
        //}
    }
    
    func compileInformation() -> FullResume{
        let basic: BasicInfo = BasicInfo(fN: stepOne.fullName.text!, e: stepOne.email.text!, pN: stepOne.phoneNumber.text!, l: stepOne.link.text!)
        let objective: String = stepTwo.textView.text! 
        let arrayOfWorks: [Work] = stepThree.arrayOfWorks
        let arrayOfSchools: [School] = stepFour.arrayOfSchools
        let skills: [String] = stepFive.skills
        
        let fullResume: FullResume = FullResume(bI: basic, o: objective, aW: arrayOfWorks, aS: arrayOfSchools, s: skills)
        
        
        return fullResume
    }

}

extension MainFlowViewController: MainNavBarDelegate, StepOneDelegate, StepTwoDelegate, StepThreeDelegate, StepFourDelegate, StepFiveDelegate{
    
    
    func contactWasSelected() {
        if aView != 0{
            selectContact()
        }
    }
    
    func objectiveWasSelected() {
        if aView != 1{
            selectObjective()
        }
    }
    
    func workWasSelected() {
        if aView != 2{
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
    
    func timeToExport() {
        let fullResume = compileInformation()
        let vc = storyboard?.instantiateViewController(withIdentifier: "exportView") as! ExportViewController
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
