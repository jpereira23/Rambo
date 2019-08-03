//
//  NavButton.swift
//  Rambo
//
//  Created by Jeffery Pereira on 7/17/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

protocol NavButtonDelegate{
    func buttonSelected(index: Int)
}

class NavButton: UIView {

    @IBOutlet weak var theButton: UIButton!
    var index: Int! 
    var aDelegate: NavButtonDelegate?
    var bottomLine = CALayer()
    
    override func awakeFromNib() {
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height + 10.0, width: 61.0, height: 1.0)
        bottomLine.backgroundColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0).cgColor
        bottomLine.isHidden = true
        self.theButton.layer.addSublayer(bottomLine)
        
        
        //self.theButton.setTitleColor(UIColor.white, for: .normal)
        NSLog("Hello World")
        
        
    }
    
    
    @IBAction func selectedButton(_ sender: Any) {
        aDelegate!.buttonSelected(index: self.index)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
