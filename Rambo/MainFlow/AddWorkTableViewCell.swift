//
//  AddWorkTableViewCell.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/8/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class AddWorkTableViewCell: UITableViewCell {
    @IBOutlet weak var jobTitle: UITextField!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var isEmployed: UISwitch!
    @IBOutlet weak var CITY: UITextField!
    @IBOutlet weak var aDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func checkUse() -> Bool{
        if jobTitle.text!.count > 0 && companyName.text!.count > 0 && startDate.text!.count > 0 && endDate.text!.count > 0 && CITY.text!.count > 0 && aDescription.text!.count > 0{
            return true
        }
        
        return false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
