//
//  ThirdWayTableViewCell.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/11/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

protocol ThirdWayTableViewCellDelegate{
    func triggerIt()
}
class ThirdWayTableViewCell: UITableViewCell {
    var aDelegate: ThirdWayTableViewCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func newResume(_ sender: Any) {
        aDelegate.triggerIt()
    }
    
}
