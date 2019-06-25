//
//  ViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/10/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class SelectATemplateViewController: UIViewController {
    let coreDataHelper: CoreDataHelper = CoreDataHelper()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var continue0: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continue0.layer.cornerRadius = 5
        
        let aSlide = Bundle.main.loadNibNamed("Template", owner: self, options: nil)?.first as! Template
        
        aSlide.title.text = "Genesis"
        
        let url = Bundle.main.url(forResource: "resume", withExtension: "html")!
        let request = URLRequest(url: url)
        aSlide.webView.load(request)
        scrollView.addSubview(aSlide)
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

