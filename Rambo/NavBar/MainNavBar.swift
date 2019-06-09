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
}

class MainNavBar: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var aDelegate: MainNavBarDelegate?
    
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var objectiveButton: UIButton!
    @IBOutlet weak var workButton: UIButton!
    @IBOutlet weak var educationButton: UIButton!
    @IBOutlet weak var skillsButton: UIButton!
    
    
    override func awakeFromNib(){
    }
    
    @IBAction func contactSelected(_ sender: Any) {
        aDelegate?.contactWasSelected()
    }
    
    @IBAction func objectiveSelected(_ sender: Any) {
        aDelegate?.objectiveWasSelected()
    }
    
    @IBAction func workSelected(_ sender: Any) {
        aDelegate?.workWasSelected()
    }
    
    @IBAction func educationSelected(_ sender: Any) {
        aDelegate?.educationWasSelected()
    }
    
    @IBAction func skillsSelected(_ sender: Any) {
        aDelegate?.skillsWasSelected()
    }
    
    
    

}
