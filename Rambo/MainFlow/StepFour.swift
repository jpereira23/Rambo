//
//  StepFour.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/5/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

protocol StepFourDelegate{
    func DANextOne()
    func stepFourAlertCell()
}
class StepFour: UIView {

    @IBOutlet weak var tableview: UITableView!
    var arrayOfSchools: [School] = []
    var aDelegate: StepFourDelegate!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @IBAction func addSchool(_ sender: Any) {
        let last = arrayOfSchools.count - 1
        let aCell = tableview.cellForRow(at: IndexPath(row: last, section: 0)) as! AddSchoolTableViewCell
        
        if aCell.checkUse(){
            getData(aCell: aCell, index: last)
            
            let aSchool = School()
            arrayOfSchools.append(aSchool)
            
            tableview.reloadData()
            tableview.scrollToRow(at: IndexPath(row: (arrayOfSchools.count-1), section: 0), at: .middle, animated: true)
        } else {
            aDelegate.stepFourAlertCell()
        }
    }
    
    func checkUse() -> Bool{
        let last = arrayOfSchools.count - 1
        let aCell = tableview.cellForRow(at: IndexPath(row: last, section: 0)) as! AddSchoolTableViewCell
        if arrayOfSchools.count > 1 && aCell.checkUse() {
            return true
        }
        
        return false
    }
    
    @IBAction func next(_ sender: Any) {
        if checkUse(){
            for i in 0..<arrayOfSchools.count{
                getData(aCell: tableview.cellForRow(at: IndexPath(row: i, section: 0)) as! AddSchoolTableViewCell, index: i)
            }
            
            aDelegate.DANextOne()
        } else {
            aDelegate.stepFourAlertCell()
        }
    }
    
    
    func getData(aCell: AddSchoolTableViewCell, index: Int){
        arrayOfSchools[index].schoolName = aCell.schoolName.text
        arrayOfSchools[index].areaOfStudy = aCell.areaOfStudy.text
        arrayOfSchools[index].city = aCell.city.text
        arrayOfSchools[index].degree = aCell.degree.text
        arrayOfSchools[index].startDate = Date()
        arrayOfSchools[index].endDate = Date()
        arrayOfSchools[index].stillEmployee = aCell.isEmployee.isOn
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        let bundle = Bundle(for: type(of: self))
        let aSchool = School()
        arrayOfSchools.append(aSchool)
        let nib = UINib(nibName: "AddSchoolTableViewCell", bundle: bundle)
        self.tableview.register(nib, forCellReuseIdentifier: "aCell")
        self.tableview.delegate = self
        self.tableview.allowsSelection = false
        self.tableview.dataSource = self
        
        self.tableview.reloadData()
    }

}

extension StepFour: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfSchools.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 387.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aCell") as! AddSchoolTableViewCell
        
        cell.schoolName.text = self.arrayOfSchools[indexPath.row].schoolName
        cell.areaOfStudy.text = self.arrayOfSchools[indexPath.row].areaOfStudy
        cell.city.text = self.arrayOfSchools[indexPath.row].city
        cell.degree.text = self.arrayOfSchools[indexPath.row].degree
        cell.isEmployee.isOn = self.arrayOfSchools[indexPath.row].stillEmployee
        
        return cell
    }
    
    
    
}
