//
//  StepThree.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/5/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
protocol StepThreeDelegate{
    func zeNextOne()
    func stepThreeAlertCell()
}
class StepThree: UIView {

    @IBOutlet weak var continue3: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var aDelegate: StepThreeDelegate!
    var arrayOfWorks: [Work] = []
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        let bundle = Bundle(for: type(of: self))
        let aWork = Work()
        arrayOfWorks.append(aWork)
        let nib = UINib(nibName: "AddWorkTableViewCell", bundle: bundle)
        self.tableView.register(nib, forCellReuseIdentifier: "laCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = false
        self.tableView.reloadData()
    }
    
    func getData(aCell: AddWorkTableViewCell, index: Int){
        arrayOfWorks[index].jobTitle = aCell.jobTitle.text
        arrayOfWorks[index].city = aCell.CITY.text
        arrayOfWorks[index].description = aCell.aDescription.text
        arrayOfWorks[index].companyName = aCell.companyName.text
        arrayOfWorks[index].startDate = Date()
        arrayOfWorks[index].endDate = Date()
        
    }
    
    func checkUse() -> Bool{
        let last = arrayOfWorks.count - 1
        let aCell = tableView.cellForRow(at: IndexPath(row: last, section: 0)) as! AddWorkTableViewCell
        if arrayOfWorks.count > 0 && aCell.checkUse(){
            return true
        }
        
        return false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }

    @IBAction func next(_ sender: Any) {
        
        if checkUse(){
            for i in 0..<arrayOfWorks.count{
                getData(aCell: tableView.cellForRow(at: IndexPath(row: i, section: 0)) as! AddWorkTableViewCell, index: i)
            }
            
            aDelegate.zeNextOne()
        } else {
            aDelegate.stepThreeAlertCell()
        }
    }
    
    @IBAction func addEmployer(_ sender: Any) {
        let last = arrayOfWorks.count - 1
        let aCell = tableView.cellForRow(at: IndexPath(row: last, section: 0)) as! AddWorkTableViewCell
        if aCell.checkUse(){
            getData(aCell: aCell, index: last)
            let aWork = Work()
            
            arrayOfWorks.append(aWork)
            
            tableView.reloadData()
            tableView.scrollToRow(at: IndexPath(row: (arrayOfWorks.count-1), section: 0), at: .middle, animated: true)
        } else {
            aDelegate.stepThreeAlertCell()
        }
        
        
    }
    
}

extension StepThree: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfWorks.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 625.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "laCell") as! AddWorkTableViewCell
        
        //Textfields Right Padding
        let indentView0 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        cell.jobTitle.leftView = indentView0
        cell.jobTitle.leftViewMode = .always
        
        let indentView1 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        cell.CITY.leftView = indentView1
        cell.CITY.leftViewMode = .always
        
        //let indentView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        //cell.aDescription.leftView = indentView2
        //cell.aDescription.leftViewMode = .always
        
        let indentView3 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        cell.startDate.leftView = indentView3
        cell.startDate.leftViewMode = .always
        
        let indentView4 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        cell.endDate.leftView = indentView4
        cell.endDate.leftViewMode = .always
        
        let indentView5 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        cell.companyName.leftView = indentView5
        cell.companyName.leftViewMode = .always
        
        
        return cell
    }
    
    
}
