//
//  MainViewController.swift
//  Rambo
//
//  Created by Jeffery Pereira on 5/19/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var accountButton: UIButton!
    let coreDataHelper: CoreDataHelper = CoreDataHelper()
    var isSignedIn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        if let aProfile: User = coreDataHelper.loadProfile(){
            accountButton.setTitle("Sign Out", for: .normal)
            accountLabel.text = "Hi " + aProfile.email + "!"
            isSignedIn = true
        } else {
            accountButton.setTitle("Sign In", for: .normal)
            accountLabel.text = "Hi User!"
            isSignedIn = false
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func accountAction(_ sender: Any) {
        if isSignedIn{
            
        } else {
            
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

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        return 1
    }
}
