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
    var isEdit: Bool = false
    var arrayOfTemplateNames: [String] = ["Column", "Red", "Roboto", "Traditional"]
    var arrayOfSlides: [Template] = []
    var fullResume: FullResume!
    var editIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        if #available(iOS 13.0, *) {
//            preferredUserInterfaceStyle = .light
//        } else {
//            // Fallback on earlier versions
//        }
        scrollView.layer.shadowColor = UIColor.black.cgColor
        scrollView.layer.shadowOffset = CGSize(width: 0, height: 1)
        scrollView.layer.shadowOpacity = 0.1
        scrollView.layer.shadowRadius = 5.0
        scrollView.layer.masksToBounds = false
        
        self.modalPresentationStyle = .fullScreen
        
//        continue0.layer.cornerRadius = 5.0
        
        setUpScrollView()
        
        self.scrollView.scrollRectToVisible(CGRect(x: 3 * 376, y: 0, width: 376, height: 414), animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 10, animations: {
            self.scrollView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 376, height: 414), animated: true)
            
            //self.scrollView.scrollRectToVisible(CGRect(x: 414, y: 0, width: 414, height: 332), animated: true)
        }, completion: nil)
    
        
        //self.scrollView.scrollRectToVisible(CGRect(x: 414, y: 0, width: 414, height: 332), animated: true)
        
        
    }
    
    func setUpScrollView(){
        
        NSLog("width = \(scrollView.frame.width)")
        
        
        scrollView.frame = CGRect(x: 0, y: 220.5, width: 376, height: 800)
        scrollView.contentSize = CGSize(width: (376.0) * 4, height: 0)
        scrollView.isPagingEnabled = true
        
        for i in 0..<arrayOfTemplateNames.count{
            let aSlide = Bundle.main.loadNibNamed("Template", owner: self, options: nil)?.first as! Template
            NSLog("aSlide.width = \(aSlide.frame.width)"
            )
            aSlide.title.text = arrayOfTemplateNames[i]
            let node = Node()
            node.setCSS(css: i)
             let url = Bundle.main.url(forResource: "master", withExtension: "html")
            aSlide.webView.loadHTMLString(node.combinedHTML, baseURL: url)
            aSlide.frame = CGRect(x: i * Int(376), y: 0, width: Int(376), height: Int(414))
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
            
            if isEdit == true{
                mainFlow.isEdit = true
                mainFlow.editIndex = self.editIndex
            }
            if fullResume != nil{
                mainFlow.fullResume = fullResume
            }
            NSLog("Here is the index it is on \(Int(scrollView.contentOffset.x / scrollView.frame.size.width))")
            mainFlow.anIndex = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        }
    }
}

