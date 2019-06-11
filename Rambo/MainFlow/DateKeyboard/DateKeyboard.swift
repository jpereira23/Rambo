//
//  DateKeyboard.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/11/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit


protocol DateKeyboardDelegate: class{
    func keyWasTapped(date: String)
}
class DateKeyboard: UIView {
    
    weak var delegate: DateKeyboardDelegate?
    @IBOutlet weak var datePicker: UIDatePicker!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews()
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initializeSubviews()
    }
    
    func initializeSubviews(){
        let xibFileName = "DateKeyboard"
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }

    @IBAction func getDate(_ sender: Any) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/YYYY"
        
        self.delegate?.keyWasTapped(date: dateFormatter.string(from: datePicker.date))
    }
}
