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
        
        scrollView.layer.shadowColor = UIColor.black.cgColor
        scrollView.layer.shadowOffset = CGSize(width: 0, height: 1)
        scrollView.layer.shadowOpacity = 0.1
        scrollView.layer.shadowRadius = 5.0
        scrollView.layer.masksToBounds = false
        
        self.modalPresentationStyle = .fullScreen
        
        continue0.layer.cornerRadius = 5
        
        setUpScrollView()
    }
    
    func setUpScrollView(){
        scrollView.frame = CGRect(x: 0, y: 208, width: 414, height:332)
        scrollView.contentSize = CGSize(width: 414 * 2, height: 332)
        
        
        let aSlide = Bundle.main.loadNibNamed("Template", owner: self, options: nil)?.first as! Template
        
        aSlide.title.text = "Genesis"
        
        let url = Bundle.main.url(forResource: "resume", withExtension: "html")!
        let request = URLRequest(url: url)
        aSlide.webView.load(request)
        
        aSlide.frame = CGRect(x: 0, y: 0 , width: 414, height: 332)
        scrollView.addSubview(aSlide)
        
        let aSlide1 = Bundle.main.loadNibNamed("Template", owner: self, options: nil)?.first as! Template
        
        aSlide1.title.text = "Uno"
        
        let url1 = Bundle.main.url(forResource: "resume", withExtension: "html")!
        let request1 = URLRequest(url: url1)
        aSlide1.webView.load(request1)
        
        aSlide1.frame = CGRect(x: 414, y: 0 , width: 414, height: 332)
        scrollView.addSubview(aSlide1)
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

