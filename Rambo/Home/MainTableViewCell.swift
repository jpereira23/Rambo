//
//  MainTableViewCell.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/19/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import WebKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var webView: WKWebView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func editAction(_ sender: Any) {
    }
    
    @IBAction func exportAction(_ sender: Any) {
    }
    
    @IBAction func miscAction(_ sender: Any) {
    }
}
