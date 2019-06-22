//
//  MainViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/19/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{

    @IBOutlet var buildNew: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var accountButton: UIButton!
    let coreDataHelper: CoreDataHelper = CoreDataHelper()
    var isSignedIn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshPage()
        // Do any additional setup after loading the view.
    }
    
    func refreshPage(){
        coreDataHelper.resetCoreData()
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ThirdWayTableViewCell", bundle: bundle)
        self.tableView.register(nib, forCellReuseIdentifier: "cellBitch")
        tableView.reloadData()
        if let aProfile: User = coreDataHelper.loadProfile(){
            accountButton.setTitle("Sign Out", for: .normal)
            accountLabel.text = "Hi " + aProfile.username + "!"
            isSignedIn = true
            NSLog("Signed In")
        } else {
            NSLog("Not Signed In")
            accountButton.setTitle("Sign In", for: .normal)
            accountLabel.text = "Hi User!"
            isSignedIn = false
        }
        
        buildNew.layer.cornerRadius = 3
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refreshPage()
    }
    
    @IBAction func accountAction(_ sender: Any) {
        if isSignedIn{
            NSLog("Its SignedIn")
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "signIn") as! SignInViewController
            
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            
            self.present(vc, animated: true, completion: nil)
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

extension MainViewController: UITableViewDelegate, UITableViewDataSource, ThirdWayTableViewCellDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBitch") as! ThirdWayTableViewCell
            cell.aDelegate = self
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell") as! MainTableViewCell
        let url = Bundle.main.url(forResource: "sample_one", withExtension: "html")
        let request = URLRequest(url: url!)
        cell.webView.load(request)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 475.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func triggerIt() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "selectTemplate") as! SelectATemplateViewController
        
        self.present(vc, animated: true, completion: nil)
    }
}
