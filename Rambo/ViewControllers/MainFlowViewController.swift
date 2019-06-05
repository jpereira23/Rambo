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
    let stepOne: StepOne = Bundle.main.loadNibNamed("StepOne", owner: self, options: nil)?.first as! StepOne
    let stepTwo: StepTwo = Bundle.main.loadNibNamed("StepTwo", owner: self, options: nil)?.first as! StepTwo
    let stepThree: StepThree = Bundle.main.loadNibNamed("StepThree", owner: self, options: nil)?.first as! StepThree
    
    let stepFour: StepFour = Bundle.main.loadNibNamed("StepFour", owner: self, options: nil)?.first as! StepFour
    
    let stepFive: StepFive = Bundle.main.loadNibNamed("StepFive", owner: self, options: nil)?.first as! StepFive
    
    var aView: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let aMainNavBar: MainNavBar = Bundle.main.loadNibNamed("MainNavBar", owner: self, options: nil)?.first as! MainNavBar
        
        aMainNavBar.aDelegate = self
        
        mainNavBar.addSubview(aMainNavBar)
        theView.addSubview(stepOne)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if aView != 4{
            aView+=1
            switch(aView){
            case 0:
                selectContact()
                break
            case 1:
                selectObjective()
                break
            case 2:
                selectWork()
                break
            case 3:
                selectEducation()
                break
            case 4:
                selectSkill()
                break
            default:
                break
            }
        }
    }
    
    func selectContact(){
        self.theView.subviews[0].removeFromSuperview()
        self.theView.addSubview(stepOne)
        aView = 0
    }
    
    func selectObjective(){
        self.theView.subviews[0].removeFromSuperview()
        self.theView.addSubview(stepTwo)
        aView = 1
    }
    
    func selectWork(){
        self.theView.subviews[0].removeFromSuperview()
        self.theView.addSubview(stepThree)
        aView = 2
    }
    
    func selectEducation(){
        self.theView.subviews[0].removeFromSuperview()
        self.theView.addSubview(stepFour)
        aView = 3
    }
    
    func selectSkill(){
        self.theView.subviews[0].removeFromSuperview()
        self.theView.addSubview(stepFive)
        aView = 4
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainFlowViewController: MainNavBarDelegate{
    func contactWasSelected() {
        if aView != 0{
            selectContact()
        }
        NSLog("contact was selected")
    }
    
    func objectiveWasSelected() {
        
        if aView != 1{
            selectObjective()
        }
        NSLog("objective was selected")
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
    
}
