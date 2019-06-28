//
//  AddSchoolTableViewCell.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/8/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit


protocol AddSchoolTableViewCellDelegate{
}
class AddSchoolTableViewCell: UITableViewCell, DateKeyboardDelegate {

    @IBOutlet weak var schoolName: UITextField!
    @IBOutlet weak var degree: SearchFieldClass!
    @IBOutlet weak var areaOfStudy: SearchFieldClass!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var isEmployee: UISwitch!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var country: UITextField!
    
    let keyboardView = DateKeyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
    var aDelegate: AddSchoolTableViewCellDelegate!
    var index: Int!
    var isStart: Bool = false
    var isEnd: Bool = false
    var degrees: [String] = ["Associate's Degree", "Bachelor's of Arts", "Bachelor's of Science", "Doctorate", "GED", "Masters"]
    
    var majors: [String] = ["Accounting", "Actuarial Sciences", "Advertising", "Agriculture", "Agricultural and Biological Engineering", "Agricultural Business Management", "Agriculture Economics", "Animal Bioscience", "Animal Sciences", "Anthropology", "Applied Mathematics", "Archaeology", "Architectual Engineering", "Architecture", "Art History", "Studio Art", "Art Education", "Bibehavioral Health", "Biochemistry", "Bioengineering", "Biology", "Biophysics", "Biotechnology", "Business Administration and Management", "Business Logistics", "Chemical Engineering", "Chemistry", "Children", "Civil Engineering", "Communications", "Computer Engineering", "Computer Science", "Crime, Law, and Justice", "Dance", "Earth Sciences", "Economics", "Electrical Engineering", "Elementary and Kindergarten Education", "Engineering Science", "English", "Environmental Systems Engineering", "Environmental Sciences", "Environmental Resource Management", "Film and Video", "Finance", "Food Science", "Forest Science", "Forest Technology", "General Science", "Geography", "Geosciences", "Graphic Design and Photography", "Health and Physical Education", "Health Policy and Administration", "History", "Horticulture", "Hotel, Restauarant and Institutional Management", "Human Development and Family Studies", "Industrial Engineering", "Information Sciences and Technology", "Journalism", "Kinesiology", "Landscape Architecture", "Law Enforcement and Correction", "Marine Biology", "Marketing", "Mathematics", "Mechanical Engineering", "Media Studies", "Meteorology", "Microbiology", "Mineral Economics", "Modern Languages", "Music Education", "Nuclear Engineering", "Nursing", "Nutrition", "Philosiphy", "Physics", "Physiology", "Political Science", "Pre-medicine", "Psychology", "Public Relations", "Real Estate", "Recreation and Parks", "Rehabilitation Services", "Religious Studies", "Secondary Education", "Sociology", "Social Work", "Special Education", "Speech Communication", "Speech Pathology and Audiology/Communication Disorder", "Statistics", "Telecommunications", "Theater", "Wildlife and Fishery Science", "Wildlife Technology", "Women's Studies"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Intialization code
        
        isEmployee.isOn = true
        endDate.text = "Present"
        endDate.isEnabled = false
        degree.dataList = degrees
        areaOfStudy.dataList = majors
        
        startDate.addTarget(self, action: #selector(startDateSelected), for: .editingDidBegin)
        endDate.addTarget(self, action: #selector(endDateSelected), for: .editingDidBegin)
        
        isEmployee.addTarget(self, action: #selector(employedSelected), for: .valueChanged)
        startDate.inputView = keyboardView
        endDate.inputView = keyboardView
        keyboardView.delegate = self
    }
    
    @objc func countryStartEditing(textField: UITextField){
        NSLog(country.text!)
    }
    
    @objc func startDateSelected(textField: UITextField){
        isStart = true
    }
    
    @objc func endDateSelected(textField: UITextField){
        isEnd = true
    }
    
    @objc func employedSelected(){
        if isEmployee.isOn {
            endDate.text = "Present"
            endDate.isEnabled = false
        } else {
            endDate.text = ""
            endDate.isEnabled = true
        }
    }
    func process(string: String) throws{
        
    }
    func processFile(at url: URL) throws{
        let s = try String(contentsOf: url)
        try process(string: s)
    }
    
    func keyWasTapped(date: String) {
        NSLog(date)
        if isStart{
            startDate.text = date
            startDate.inputView = nil
            startDate.reloadInputViews()
            startDate.endEditing(true)
            isStart = false
        }
        
        if isEnd{
            endDate.text = date
            endDate.inputView = nil
            endDate.reloadInputViews()
            endDate.endEditing(true)
            isEnd = false
        }
        
    }
    
    func checkUse() -> Bool {
        if schoolName.text!.count > 0 && degree.text!.count > 0 && areaOfStudy.text!.count > 0 && startDate.text!.count > 0 && endDate.text!.count > 0 && city.text!.count > 0 {
            return true
        }
        
        return false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
