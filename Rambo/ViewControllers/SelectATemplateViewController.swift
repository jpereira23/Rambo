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
    var aChange: Bool = true
    var templates: [TemplateWeb] = []
    var files: [String] = ["sample_one", "sample_two"]
    var templateNames: [String]  = ["Genesis", "Logan"]
    var templateSubNames: [String] = ["(recommended)", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        //setUpTemplates()
        //coreDataHelper.resetCoreData()
        /*
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
        } else {
    */
            let vc = storyboard?.instantiateViewController(withIdentifier: "onBoarding")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = vc
            print("First launch, setting UserDefault.")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
       // }
 
        
        
        // Do any additional setup after loading the view.
    }
    
    private func setUpTemplates(){
        let background: SelectTemplate = Bundle.main.loadNibNamed("SelectTemplate", owner: self)?.first as! SelectTemplate
        background.headerField.text = "STEP 1 OF 3"
        background.subHeaderField.text = "Select a Template"
        let templateScroll: TemplateScroll =
            Bundle.main.loadNibNamed("TemplateScroll", owner: self)?.first as! TemplateScroll
        templateScroll.frame = CGRect(x: 0, y: 150, width: 414, height: 446)
        templateScroll.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
        templateScroll.templateScrollView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
        
        for i in 0..<files.count{
            let templateWeb: TemplateWeb = Bundle.main.loadNibNamed("TemplateWeb", owner: self)?.first as! TemplateWeb
            templateWeb.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
            templateWeb.header.text = templateNames[i]
            templateWeb.subHeader.text = templateSubNames[i]
            let url = Bundle.main.url(forResource: files[i], withExtension: "html")!
            let request = URLRequest(url: url)
            templateWeb.webView.load(request)
            templates.append(templateWeb)
        }
        
        templateScroll.setSlides(templates: templates)
        
        view.addSubview(background)
        view.addSubview(templateScroll)
    }

    @IBAction func submitResume(_ sender: Any) {
        if coreDataHelper.loadProfile() == nil{
            let vc = storyboard?.instantiateViewController(withIdentifier: "SignUp")
            self.present(vc!, animated: false, completion:   nil)
        }
    }
    
}

