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
    @IBOutlet weak var buildNew: UIButton!
    var aDelegate: ThirdWayTableViewCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        buildNew.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func newResume(_ sender: Any) {
        aDelegate.triggerIt()
    }
    
}
