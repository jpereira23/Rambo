//
//  SplashScreenViewController.swift
//  Rambo
//
//  Created by Waldo-C on 5/11/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SplashScreenViewController: UIViewController {
    
    var worthyLogoImgView:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        preferredUserInterfaceStyle = .light
        overrideUserInterfaceStyle = .light
        self.modalPresentationStyle = .fullScreen
        
        // Do any additional setup after loading the view.
        worthyLogoImgView = UIImageView(frame: CGRect(x: (self.view.bounds.width/2)-50, y: (self.view.bounds.height/2)-50, width: 93, height: 90))
        
        worthyLogoImgView!.image = UIImage(named: "worthy-logo.png")
        self.view.addSubview(worthyLogoImgView!)
        
        worthyLogoImgView?.contentMode = .scaleAspectFit
        self.view.backgroundColor = UIColor(red: 13/255, green: 199/255, blue: 156/255, alpha: 1)
        
        animate()
    }
    
    func animate() {
        let duration = 1.0
        let delay = 1.5
        
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: [], animations: {
            
            //1st
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.33, animations: {
                self.worthyLogoImgView!.bounds = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2, width: 100, height: 100)
                
            })
            
            //2nd
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.33, animations: {
                self.worthyLogoImgView!.bounds = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2, width: 19, height: 27)
                
            })
            
            //3rd
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.33, animations: {
                self.worthyLogoImgView!.bounds = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2, width: 1500, height: 1500)
                
            })
            
            //4th
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.33, animations: {
                self.worthyLogoImgView!.bounds = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2, width: 4000, height: 4000)
                
            })
            
        }, completion: { (finished) in
            
            let defaults = UserDefaults.standard
            
            if let isAppAlreadyLaunchedOnce = defaults.string(forKey: "HasLaunchedOnce"){
               self.performSegue(withIdentifier: "goToLogin", sender: self)
            } else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "onBoarding") as! OnBoardingViewController
                self.present(vc, animated: true, completion: nil)
                
                
            }
            
        })
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
