//
//  ChangeSceneIndicator.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/12/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class ChangeSceneIndicator: UIView {

    @IBOutlet weak var leftOne: UIButton!
    @IBOutlet weak var leftTwo: UIButton!
    @IBOutlet weak var leftThree: UIButton!
    @IBOutlet weak var leftFour: UIButton!
    private var current: Int = 0
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeSubviews()
        leftOne.backgroundColor = UIColor(red: 12.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        leftTwo.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
        leftThree.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
        leftFour.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
    }
    
    func next(){
        current += 1
        changeColors()
    }
    
    func changeColors(){
        switch(current){
        case 0:
            leftOne.backgroundColor = UIColor(red: 12.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
            leftTwo.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            leftThree.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            leftFour.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            break
        case 1:
            leftOne.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            leftTwo.backgroundColor =  UIColor(red: 12.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
            leftThree.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            leftFour.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            break
        case 2:
            leftOne.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            leftTwo.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            leftThree.backgroundColor = UIColor(red: 12.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
            leftFour.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            break
        case 3:
            leftOne.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            leftTwo.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            leftThree.backgroundColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
            leftFour.backgroundColor = UIColor(red: 12.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
            break
        default:
            break
        }
    }
    
    func initializeSubviews(){
        let xibFileName = "ChangeSceneIndicator"
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
