//
//  TemplateScroll.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/18/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class TemplateScroll: UIView {

    @IBOutlet weak var templateScrollView: UIScrollView!
    
    
    func setSlides(templates: [TemplateWeb]){
        templateScrollView.frame = CGRect(x: 0, y: 0, width: 414, height: 446)
        templateScrollView.contentSize = CGSize(width: 414 * CGFloat(templates.count), height: 446)
        
        for i in 0..<templates.count{
            templates[i].frame = CGRect(x: 0, y: 0, width: 414 * CGFloat(i), height: 446)
            templateScrollView.addSubview(templates[i])
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
