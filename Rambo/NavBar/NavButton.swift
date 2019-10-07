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
        theButton.setTitleColor(UIColor.lightGray, for: .normal)
    }
    
    
    @IBAction func selectedButton(_ sender: Any) {
        aDelegate!.buttonSelected(index: self.index)
    }

}
