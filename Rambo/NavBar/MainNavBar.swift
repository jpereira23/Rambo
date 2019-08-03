//
//  MainNavBar.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/5/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

protocol MainNavBarDelegate{
    func contactWasSelected()
    func objectiveWasSelected()
    func workWasSelected()
    func educationWasSelected()
    func skillsWasSelected()
    func goBack()
    func exportSelected()
}

class MainNavBar: UIView {
    var aDelegate: MainNavBarDelegate?
    
    @IBOutlet weak var exportButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var objectiveButton: UIButton!
    @IBOutlet weak var workButton: UIButton!
    @IBOutlet weak var educationButton: UIButton!
    @IBOutlet weak var skillsButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let arrayOfButtonTitles: [String] = ["Contact", "Objective", "Work", "Education", "Skills"]
    var arrayOfButtonViews: [NavButton] = []
    
    override func awakeFromNib(){
        exportButton.isHidden = true
        scrollView.frame = CGRect(x: 0, y: 186, width: 425, height: 30)
        scrollView.contentSize = CGSize(width: 425, height: 30)
        for i in 0..<arrayOfButtonTitles.count{
            let aContact: NavButton = Bundle.main.loadNibNamed("NavButton", owner: self, options: nil)?.first as! NavButton
            aContact.frame = CGRect(x: (i * 85) + 20, y: 0, width: 85, height: 30)
            aContact.index = i
            
            aContact.aDelegate = self
            aContact.theButton.setTitle(arrayOfButtonTitles[i], for: .normal)
            arrayOfButtonViews.append(aContact)
            scrollView.addSubview(aContact)
 
        }
        arrayOfButtonViews[0].bottomLine.isHidden = false
  
    }

    @IBAction func exportView(_ sender: Any) {
        aDelegate!.exportSelected()
    }
    
    @IBAction func goBack(_ sender: Any) {
        aDelegate?.goBack()
    }
    
    func allButtonsFalse(){
        for button in arrayOfButtonViews{
            button.bottomLine.isHidden = true
        }
    }
    
    func moveSlider(index: Int){
        var aPoint = CGPoint(x: 300, y: 0)
        switch(index){
        case 0:
            aPoint.x = 0
            allButtonsFalse()
            arrayOfButtonViews[0].bottomLine.isHidden = false
            break
        case 1:
            aPoint.x = 25
            allButtonsFalse()
            arrayOfButtonViews[1].bottomLine.isHidden = false
            break
        case 2:
            aPoint.x = 100
            
            allButtonsFalse()
            arrayOfButtonViews[2].bottomLine.isHidden = false
            break
        case 3:
            aPoint.x = 150
            allButtonsFalse()
            arrayOfButtonViews[3].bottomLine.isHidden = false
            break
        case 4:
            aPoint.x = 200
            allButtonsFalse()
            arrayOfButtonViews[4].bottomLine.isHidden = false
            break
        default:
            break
        }
        scrollView.setContentOffset(aPoint, animated: true)
    }

}

extension MainNavBar: NavButtonDelegate{
    func buttonSelected(index: Int) {
        switch(index){
        case 0:
            aDelegate?.contactWasSelected()
            break
        case 1:
            aDelegate?.objectiveWasSelected()
            break
        case 2:
            aDelegate?.workWasSelected()
            break
        case 3:
            aDelegate?.educationWasSelected()
            break
        case 4:
            aDelegate?.skillsWasSelected()
            break
        default:
            break
        }
    }
    
    
}
