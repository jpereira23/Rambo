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
    var arrayOfTemplateNames: [String] = ["Column", "Red", "Roboto", "Traditional"]
    var arrayOfSlides: [Template] = []
    var fullResume: FullResume!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        scrollView.layer.shadowColor = UIColor.black.cgColor
        scrollView.layer.shadowOffset = CGSize(width: 0, height: 1)
        scrollView.layer.shadowOpacity = 0.1
        scrollView.layer.shadowRadius = 5.0
        scrollView.layer.masksToBounds = false
        
        self.modalPresentationStyle = .fullScreen
        
        continue0.layer.cornerRadius = 5
        
        setUpScrollView()
        /*
 
    UIView.animate(withDuration: 10.0, animations: { () -> Void in
            self.scrollView.isPagingEnabled = false
            self.scrollView.contentOffset = CGPoint(x: 414, y: 0)
        })
        */ 
        
    }
    
    func setUpScrollView(){
        scrollView.frame = CGRect(x: 0, y: 208, width: 414, height:332)
        scrollView.contentSize = CGSize(width: 414 * 4, height: 332)
        scrollView.isPagingEnabled = true
        
        for i in 0..<arrayOfTemplateNames.count{
            let aSlide = Bundle.main.loadNibNamed("Template", owner: self, options: nil)?.first as! Template
            aSlide.title.text = arrayOfTemplateNames[i]
            let node = Node()
            node.setCSS(css: i)
             let url = Bundle.main.url(forResource: "resume", withExtension: "html")
            aSlide.webView.loadHTMLString(node.combinedHTML, baseURL: url)
            aSlide.frame = CGRect(x: i * 414, y: 0, width: 414, height: 332)
            arrayOfSlides.append(aSlide)
            scrollView.addSubview(aSlide)
        }
        
    }
    @IBAction func continuing(_ sender: Any) {
        NSLog("Page is \(scrollView.contentOffset.x / scrollView.frame.size.width)")
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMainFlow"{
            let mainFlow = segue.destination as! MainFlowViewController
            if fullResume != nil{
                mainFlow.fullResume = fullResume
            }
            NSLog("Here is the index it is on \(Int(scrollView.contentOffset.x / scrollView.frame.size.width))")
            mainFlow.anIndex = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        }
    }
}

