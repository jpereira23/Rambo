//
//  OnBoardingViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/14/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController, UIScrollViewDelegate {
    var headers: [String] = ["Welcome to Worthy", "Select a Template", "Add your Details", "Export and Apply to Jobs"]
    var subHeaders: [String] = ["Your convenient resume builder.", "Get started by choosing one of our job-worthy resume templates.", "Enter your unique qualifications through our simple prompts.", "Export your resume and kick start your job hunt more ready than before."]
    var imageNames: [String] = ["welcome.png", "select-template.png", "add-details.png", "export.png"]
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var buildResume: UIButton!
    var slides: [OnBoardingView] = []
    
    
    var aSlides: [OnBoardingView] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aSlides = createSlides()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        setUpScrollView(aSlides: aSlides)
        pageControl.numberOfPages = aSlides.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor(red: 235.0/255.0, green: 234.0/255.0, blue: 236.0/255.0, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 12.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        buildResume.layer.cornerRadius = 5
        //need to check if the line aove actually works.
        
        
        // Do any additional setup after loading the view.
    }
    
    func createSlides() -> [OnBoardingView]{
        
        for count in 0...3{
            let slide1: OnBoardingView = Bundle.main.loadNibNamed("OnBoardingView", owner: self, options: nil)?.first as! OnBoardingView
            slide1.title.text = headers[count]
            slide1.subHeader.text = subHeaders[count]
            slide1.imageView.image = UIImage(named: imageNames[count])
            slides.append(slide1)
        }
        
        return slides
    }
    
    func setUpScrollView(aSlides: [OnBoardingView]){
        scrollView.frame = CGRect(x: 30, y: 145, width: 354, height: 429)
        scrollView.contentSize = CGSize(width: 354 * CGFloat(aSlides.count), height: 429)
        scrollView.isPagingEnabled = true
        
        
        for i in 0..<aSlides.count{
            aSlides[i].frame = CGRect(x: 354 * CGFloat(i), y: 0, width: 354, height: 429)
            scrollView.addSubview(aSlides[i])
        }
    }
    
    @IBAction func backToMain(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainView") as! SelectATemplateViewController
        UIApplication.shared.keyWindow?.rootViewController = vc
        vc.aChange = false
        self.present(vc, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/354)
        pageControl.currentPage = Int(pageIndex)
        
        /*
         Hi Jeff
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            //slides[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
        */
    }
    
    func scrollView(_ scrollView: UIScrollView, didScrollToPercentageOffset percentageHorizontalOffset: CGFloat) {
        if(pageControl.currentPage == 0){
            
        }
        
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
