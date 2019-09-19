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
    @IBOutlet weak var ctaBox3: UIView!
    @IBOutlet weak var tableView: UITableView!
    var aDelegate: StepThreeDelegate!
    var arrayOfWorks: [Work] = []
    var arrayOfCells: [AddWorkTableViewCell] = []
    
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
        arrayOfCells = []
        self.tableView.reloadData()
    }
    
    
    
    func getData(aCell: AddWorkTableViewCell, index: Int){
        arrayOfWorks[index].jobTitle = aCell.jobTitle.text
        arrayOfWorks[index].city = aCell.CITY.text
        arrayOfWorks[index].description = aCell.aDescription.text
        arrayOfWorks[index].companyName = aCell.companyName.text
        arrayOfWorks[index].startDate = aCell.startDate.text
        arrayOfWorks[index].endDate = aCell.endDate.text
    }
    
    func checkUse() -> Bool{
        let last = arrayOfWorks.count - 1
        let aCell = arrayOfCells[last]
        if arrayOfWorks.count > 0 && aCell.checkUse(){
            beforeYouLeave()
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
            aDelegate.zeNextOne()
        } else {
            aDelegate.stepThreeAlertCell()
        }
    }
    
    public func beforeYouLeave(){
        for i in 0..<arrayOfWorks.count{
            let last = arrayOfWorks.count - 1
            let aCell = arrayOfCells[last]
            getData(aCell: aCell, index: i)
        }
    }
    
    @IBAction func addEmployer(_ sender: Any) {
        let last = arrayOfWorks.count - 1
        let aCell = arrayOfCells[last]
        if aCell.checkUse(){
            getData(aCell: aCell, index: last)
            let aWork = Work()
            
            arrayOfWorks.append(aWork)
            arrayOfCells = []
            tableView.reloadData()
            tableView.scrollToRow(at: IndexPath(row: (arrayOfWorks.count-1), section: 0), at: .top, animated: true)
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
        
        
        if indexPath.row == 0{
            cell.deleteButton.isHidden = true
        } else {
            cell.deleteButton.isHidden = false 
        }
        
        
        cell.index = indexPath.row
        cell.aDelegate = self
    
        
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
        
        cell.jobTitle.text = arrayOfWorks[indexPath.row].jobTitle
        cell.CITY.text = arrayOfWorks[indexPath.row].city
        cell.startDate.text = arrayOfWorks[indexPath.row].startDate
        cell.endDate.text = "Present"
        cell.endDate.isEnabled = false
        cell.companyName.text = arrayOfWorks[indexPath.row].companyName
        cell.aDescription.text = arrayOfWorks[indexPath.row].description
        NSLog("cell description count is \(cell.aDescription.text)")
        if cell.aDescription.text.count == 0{
            cell.aDescription.placeholder = "Please place description here."
            cell.aDescription.viewWithTag(100)!.isHidden = false
        } else {
            cell.aDescription.viewWithTag(100)!.isHidden = true
            
        }
        
        arrayOfCells.append(cell)
        return cell
    }
    
    
}

extension StepThree: AddWorkTableViewCellDelegate{
    func deleteCell(index: Int) {
        //arrayOfCells.remove(at: index)
        arrayOfWorks.remove(at: index)
        arrayOfCells = []
        tableView.reloadData()
    }
    
    func editingBegan(y: Int) {
        var point = CGPoint(x: 0, y: y)
        self.tableView.setContentOffset(point, animated: true)
    }
    
    
}
