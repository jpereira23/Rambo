//
//  MainTableViewCell.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/19/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import WebKit

protocol MainTableViewCellDelegate{
    func editSelected(fullResume: FullResume, index: Int)
    func exportSelected(fullResume: FullResume, webView: WKWebView)
    func miscSelected(index: Int)
}

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var webView: WKWebView!
    var aDelegate: MainTableViewCellDelegate?
    var index: Int = 0
    var fullResume: FullResume! 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        webView.layer.shadowColor = UIColor.black.cgColor
        webView.layer.shadowOffset = CGSize(width: 0, height: 1)
        webView.layer.shadowOpacity = 0.1
        webView.layer.shadowRadius = 5.0
        webView.layer.masksToBounds = false
        webView.isUserInteractionEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func editAction(_ sender: Any) {
        self.aDelegate?.editSelected(fullResume: fullResume, index: index)
    }
    
    @IBAction func exportAction(_ sender: Any) {
        self.aDelegate?.exportSelected(fullResume: self.fullResume, webView: webView)
    }
    
    @IBAction func miscAction(_ sender: Any) {
        self.aDelegate?.miscSelected(index: index)
    }
}
