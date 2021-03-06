//
//  MonthYearPickerView.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/24/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//
import UIKit

class MonthYearPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var months: [String]!
    var years: [Int]!
    var aDate = NSDate()
    var year: Int = 2019
    var aYear: Int = 2019
    
    var month = 1
    var onDateSelected: ((_ month: Int, _ year: Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonSetup()
    }
    
    func commonSetup() {
        // population years
        var years: [Int] = []
        if years.count == 0 {
            //var year = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: aDate as Date)
            for _ in 1...40 {
                years.append(aYear)
                aYear -= 1
            }
        }
        self.years = years
        
        // population months with localized names
        var months: [String] = []
        var month = 0
        for _ in 1...12 {
            months.append(DateFormatter().monthSymbols[month].capitalized)
            month += 1
        }
        self.months = months
        
        self.delegate = self
        self.dataSource = self
        
        //let currentMonth = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.month, from: aDate as Date)
        //self.selectRow(currentMonth - 1, inComponent: 0, animated: false)
    }
    
    func commonSetup1() {
        // population years
        var years: [Int] = []
        if years.count == 0 {
            //var year = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: aDate as Date)
            for _ in 1...40 {
                years.append(aYear)
                aYear += 1
            }
        }
        self.years = years
        
        // population months with localized names
        var months: [String] = []
        var month = 0
        for _ in 1...12 {
            months.append(DateFormatter().monthSymbols[month].capitalized)
            month += 1
        }
        self.months = months
        
        self.delegate = self
        self.dataSource = self
        
        //let currentMonth = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.month, from: aDate as Date)
        //self.selectRow(currentMonth - 1, inComponent: 0, animated: false)
    }
    
    // Mark: UIPicker Delegate / Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return months[row]
        case 1:
            return "\(years[row])"
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return months.count
        case 1:
            return years.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let month = self.selectedRow(inComponent: 0)+1
        let year = years[self.selectedRow(inComponent: 1)]
        if let block = onDateSelected {
            block(month, year)
        }
        
        self.month = month
        self.year = year
    }
    
}
