//
//  Template.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/5/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import WebKit

class Template: UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var recommended: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var stackView: UIStackView!
    
    
    override func awakeFromNib() {
        NSLog("awakeFromNib()")
        webView.isUserInteractionEnabled = false
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
