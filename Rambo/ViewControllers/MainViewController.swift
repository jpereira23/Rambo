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
    let coreDataHelper: CoreDataHelper = CoreDataHelper()
    var isSignedIn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ThirdWayTableViewCell", bundle: bundle)
        self.tableView.register(nib, forCellReuseIdentifier: "cellBitch")
        // Do any additional setup after loading the view.
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

extension MainViewController: UITableViewDelegate, UITableViewDataSource, ThirdWayTableViewCellDelegate, MainTableViewCellDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBitch") as! ThirdWayTableViewCell
            cell.aDelegate = self
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell") as! MainTableViewCell
        cell.aDelegate = self
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
    
    func editSelected() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainFlow") as! MainFlowViewController
        
        self.present(vc, animated: true, completion: nil)
    }
}
