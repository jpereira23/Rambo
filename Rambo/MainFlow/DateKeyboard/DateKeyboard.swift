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
class DateKeyboard: UIView{
    
    weak var delegate: DateKeyboardDelegate?
    @IBOutlet weak var aPicker: UIView!
    let datePicker = MonthYearPickerView()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        datePicker.commonSetup()
        initializeSubviews()
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initializeSubviews()
    }
    
    func initializeSubviews(){
        let xibFileName = "DateKeyboard"
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        datePicker.frame = aPicker.frame
        
        aPicker.addSubview(datePicker)
        self.sendSubviewToBack(datePicker)
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    func getData(){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/YYYY"
        NSLog("\(datePicker.year)")
        switch(datePicker.month){
        case 1:
            self.delegate?.keyWasTapped(date: "Jan \(datePicker.year)")
            break
        case 2:
            self.delegate?.keyWasTapped(date: "Feb \(datePicker.year)")
            break
        case 3:
            self.delegate?.keyWasTapped(date: "Mar \(datePicker.year)")
            break
        case 4:
            self.delegate?.keyWasTapped(date: "Apr \(datePicker.year)")
            break
        case 5:
            self.delegate?.keyWasTapped(date: "May \(datePicker.year)")
            break
        case 6:
            self.delegate?.keyWasTapped(date: "Jun \(datePicker.year)")
            break
        case 7:
            self.delegate?.keyWasTapped(date: "Jul \(datePicker.year)")
            break
        case 8:
            self.delegate?.keyWasTapped(date: "Aug \(datePicker.year)")
            break
        case 9:
            self.delegate?.keyWasTapped(date: "Sept \(datePicker.year)")
            break
        case 10:
            self.delegate?.keyWasTapped(date: "Oct \(datePicker.year)")
            break
        case 11:
            self.delegate?.keyWasTapped(date: "Nov \(datePicker.year)")
            break
        case 12:
            self.delegate?.keyWasTapped(date: "Dec \(datePicker.year)")
            break
        default:
            
            break
            
        }
        /*
         datePicker.onDateSelected = { (month: Int, year: Int) in
         NSLog("No really, Hello World")
         let string = "\(month)/\(year)"
         self.delegate?.keyWasTapped(date: string)
         }
         */
    }

    /*
 
    @IBAction func getDate(_ sender: Any) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/YYYY"
        NSLog("\(datePicker.year)")
        switch(datePicker.month){
        case 1:
            self.delegate?.keyWasTapped(date: "January \(datePicker.year)")
            break
        case 2:
            self.delegate?.keyWasTapped(date: "February \(datePicker.year)")
            break
        case 3:
            self.delegate?.keyWasTapped(date: "March \(datePicker.year)")
            break
        case 4:
            self.delegate?.keyWasTapped(date: "April \(datePicker.year)")
            break
        case 5:
            self.delegate?.keyWasTapped(date: "May \(datePicker.year)")
            break
        case 6:
            self.delegate?.keyWasTapped(date: "June \(datePicker.year)")
            break
        case 7:
            self.delegate?.keyWasTapped(date: "July \(datePicker.year)")
            break
        case 8:
            self.delegate?.keyWasTapped(date: "August \(datePicker.year)")
            break
        case 9:
            self.delegate?.keyWasTapped(date: "September \(datePicker.year)")
            break
        case 10:
            self.delegate?.keyWasTapped(date: "October \(datePicker.year)")
            break
        case 11:
            self.delegate?.keyWasTapped(date: "November \(datePicker.year)")
            break
        case 12:
            self.delegate?.keyWasTapped(date: "December \(datePicker.year)")
            break
        default:
            
            break
            
        }
        /*
        datePicker.onDateSelected = { (month: Int, year: Int) in
            NSLog("No really, Hello World")
            let string = "\(month)/\(year)"
            self.delegate?.keyWasTapped(date: string)
        }
        */
    }
    */
}
