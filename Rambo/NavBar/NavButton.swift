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
    
    
    override func awakeFromNib() {
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
