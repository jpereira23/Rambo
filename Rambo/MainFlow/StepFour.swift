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

    @IBOutlet weak var continue4: UIButton!
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
            tableview.scrollToRow(at: IndexPath(row: (arrayOfSchools.count-1), section: 0), at: .top, animated: true)
        } else {
            aDelegate.stepFourAlertCell()
        }
    }
    
    func checkUse() -> Bool{
        let last = arrayOfSchools.count - 1
        let aCell = tableview.cellForRow(at: IndexPath(row: last, section: 0)) as! AddSchoolTableViewCell
        if arrayOfSchools.count > 0 && aCell.checkUse() {
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
        //arrayOfSchools[index].startDate = aCell.startDate.text
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
        let aPoint = CGPoint(x: 0, y: 0)
        self.tableview.setContentOffset(aPoint, animated: true)
        self.tableview.reloadData()
    }

}

extension StepFour: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfSchools.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 619.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aCell") as! AddSchoolTableViewCell
        
        cell.aDelegate = self
        
        //Textfields Right Padding
        let indentView0 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        cell.schoolName.leftView = indentView0
        cell.schoolName.leftViewMode = .always
        
        let indentView1 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        cell.degree.leftView = indentView1
        cell.degree.leftViewMode = .always
        
        let indentView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        cell.areaOfStudy.leftView = indentView2
        cell.areaOfStudy.leftViewMode = .always
        
        let indentView3 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        cell.startDate.leftView = indentView3
        cell.startDate.leftViewMode = .always
        
        let indentView4 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        cell.endDate.leftView = indentView4
        cell.endDate.leftViewMode = .always
        
        let indentView5 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        cell.city.leftView = indentView5
        cell.city.leftViewMode = .always
        
        
        cell.index = indexPath.row
        cell.schoolName.text = self.arrayOfSchools[indexPath.row].schoolName
        cell.areaOfStudy.text = self.arrayOfSchools[indexPath.row].areaOfStudy
        cell.city.text = self.arrayOfSchools[indexPath.row].city
        cell.degree.text = self.arrayOfSchools[indexPath.row].degree
        //cell.isEmployee.isOn = self.arrayOfSchools[indexPath.row].stillEmployee
        //cell.startDate.text = self.arrayOfSchools[indexPath.row].startDate
        
        return cell
    }
    
}

extension StepFour: AddSchoolTableViewCellDelegate{
    func startedEditing(y: Int) {
        var point = CGPoint(x: 0, y: y)
        NSLog("point = \(point)")
        //point.y = point.y - 5
        self.tableview.setContentOffset(point, animated: true)
    }
}
