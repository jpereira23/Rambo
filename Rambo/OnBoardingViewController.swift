//
//  OnBoardingViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/14/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    var headers: [String] = ["Welcome to Worthy", "Select a Template", "Add your Details", "Export and Apply to Jobs"]
    var subHeaders: [String] = ["Your convenient resume builder.", "Get started by choosing one of our \n job-worthy resume templates.", "Enter your unique qualifications through \nour simple prompts.", "Export your resume and kick start your job \nhunt more ready than before."]
    var imageNames: [String] = ["welcome.png", "select-template.png", "add-details.png", "export.png"]
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var buildResume: UIButton!
    
    
    var aSlides: [OnBoardingView] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aSlides = createSlides()
        
        setUpScrollView(slides: aSlides)
        pageControl.numberOfPages = aSlides.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 12.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        buildResume.layer.cornerRadius = 5
        
        
        // Do any additional setup after loading the view.
    }
    
    func createSlides() -> [OnBoardingView]{
        var slides: [OnBoardingView] = []
        
        for count in 0...3{
            let slide1: OnBoardingView = Bundle.main.loadNibNamed("OnBoardingView", owner: self, options: nil)?.first as! OnBoardingView
            slide1.title.text = headers[count]
            slide1.subHeader.text = subHeaders[count]
            slide1.imageView.image = UIImage(named: imageNames[count])
            slides.append(slide1)
        }
        
        return slides
    }
    
    func setUpScrollView(slides: [OnBoardingView]){
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        
        for i in 0..<slides.count{
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    @IBAction func backToMain(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainView") as! SelectATemplateViewController
        UIApplication.shared.keyWindow?.rootViewController = vc
        vc.aChange = false
        self.present(vc, animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
