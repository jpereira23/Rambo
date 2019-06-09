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
        return 387.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "laCell") as! AddWorkTableViewCell
        
        return cell
    }
    
    
}
