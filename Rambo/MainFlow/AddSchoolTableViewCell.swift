//
//  AddSchoolTableViewCell.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/8/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit


protocol AddSchoolTableViewCellDelegate{
    func startedEditing(y: Int)
    func deletingSchool(index: Int)
}

struct SchoolStuff{
    var dapipid: String
    var opeId: String
    var ipedsunitids: String
    var locationName: String
    var parentName: String
    var parentdapipid: String
    var locationtype: String
    var address: String
    var generalPhone: String
    var adminName: String
    var adminPhone: String
    var adminEmail: String
    var fax: String
    var updateDate: String

    init(dap: String, ope: String, iped: String, location: String, parent: String, parentDap: String, locationType: String, addresS: String, general: String, adminNamE: String, adminPhonE: String, adminEmaiL: String, faX: String, updateDatE: String){
        dapipid = dap
        opeId = ope
        ipedsunitids = iped
        locationName = location
        parentName = parent
        parentdapipid = parentDap
        locationtype = locationType
        address = addresS
        generalPhone = general
        adminName = adminNamE
        adminPhone = adminPhonE
        adminEmail = adminEmaiL
        fax = faX
        updateDate = updateDatE
    }
}


class AddSchoolTableViewCell: UITableViewCell, DateKeyboardDelegate {

    @IBOutlet weak var schoolName: SearchFieldClass!
    @IBOutlet weak var degree: SearchFieldClass!
    @IBOutlet weak var areaOfStudy: SearchFieldClass!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var isEmployee: UISwitch!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var schoolNameStack: UIStackView!
    @IBOutlet weak var degreeStack: UIStackView!
    @IBOutlet weak var areaOfStudyStack: UIStackView!
    @IBOutlet weak var startDateStack: UIStackView!
    @IBOutlet weak var endDateStack: UIStackView!
    @IBOutlet weak var cityStack: UIStackView!
    
    let keyboardView = DateKeyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
    var aDelegate: AddSchoolTableViewCellDelegate!
    var index: Int!
    var isStart: Bool = false
    var isEnd: Bool = false
    var degrees: [String] = ["Associate's Degree", "Bachelor's of Arts", "Bachelor's of Science", "Diploma","Doctorate", "GED", "Masters"]
    
    var majors: [String] = ["Accounting", "Actuarial Sciences", "Advertising", "Agriculture", "Agricultural and Biological Engineering", "Agricultural Business Management", "Agriculture Economics", "Animal Bioscience", "Animal Sciences", "Anthropology", "Applied Mathematics", "Archaeology", "Architectual Engineering", "Architecture", "Art History", "Studio Art", "Art Education", "Bibehavioral Health", "Biochemistry", "Bioengineering", "Biology", "Biophysics", "Biotechnology", "Business Administration and Management", "Business Logistics", "Chemical Engineering", "Chemistry", "Children", "Civil Engineering", "Communications & Media", "Communication Studies", "Computer Engineering", "Computer Science", "Crime, Law, and Justice", "Dance", "Earth Sciences", "Economics", "Electrical Engineering", "Elementary and Kindergarten Education", "Engineering Science", "English", "Environmental Systems Engineering", "Environmental Sciences", "Environmental Resource Management", "Film and Video", "Finance", "Food Science", "Forest Science", "Forest Technology", "General Science", "Geography", "Geosciences", "Graphic Design and Photography", "Health and Physical Education", "Health Policy and Administration", "History", "Horticulture", "Hotel, Restauarant and Institutional Management", "Human Development and Family Studies", "Industrial Engineering", "Information Sciences and Technology", "Journalism", "Kinesiology", "Landscape Architecture", "Law Enforcement and Correction", "Marine Biology", "Marketing", "Mathematics", "Mechanical Engineering", "Media Studies", "Meteorology", "Microbiology", "Mineral Economics", "Modern Languages", "Music Education", "Nuclear Engineering", "Nursing", "Nutrition", "Philosiphy", "Physics", "Physiology", "Political Science", "Pre-medicine", "Psychology", "Public Relations", "Real Estate", "Recreation and Parks", "Rehabilitation Services", "Religious Studies", "Secondary Education", "Sociology", "Social Work", "Special Education", "Speech Communication", "Speech Pathology and Audiology/Communication Disorder", "Statistics", "Telecommunications", "Theater", "Wildlife and Fishery Science", "Wildlife Technology", "Women's Studies"]
    override func awakeFromNib() {
        //super.awakeFromNib()
        // Intialization code
        /*
        do {
            let theUrl = Bundle.main.path(forResource: "InstitutionCampus", ofType: "csv") as! String
            let u = URL(fileURLWithPath: theUrl)
            try processFile(at: u)
        } catch {
            print("error processing: \(error)")
        }
        */
        
        isEmployee.isOn = true
        endDate.text = "Present"
        endDate.isEnabled = false
        degree.dataList = degrees
        
        
        schoolName.delegate = self
        degree.delegate = self
        areaOfStudy.delegate = self
        startDate.delegate = self
        endDate.delegate = self
        city.delegate = self
        
        schoolName.autocapitalizationType = .words
        degree.autocapitalizationType = .words
        areaOfStudy.autocapitalizationType = .words
        city.autocapitalizationType = .words
        
        areaOfStudy.dataList = majors
        
        startDate.addTarget(self, action: #selector(startDateSelected), for: .editingDidBegin)
        endDate.addTarget(self, action: #selector(endDateSelected), for: .editingDidBegin)
        
        isEmployee.addTarget(self, action: #selector(employedSelected), for: .valueChanged)
        
        var aYear = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: NSDate() as Date)
        
        keyboardView.datePicker.aYear = (aYear)
        keyboardView.datePicker.commonSetup()
        startDate.inputView = keyboardView
        endDate.inputView = keyboardView
        keyboardView.delegate = self
        
        addDoneButton()
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
        /*
 
        let stringOfWordsArray = try string.components(separatedBy: ",")
        for i in 0..<stringOfWordsArray.count{
            //NSLog("\(i%14): \(stringOfWordsArray[i])")
            if (i%13) == 3{
            
                arrayOfSchools.append(stringOfWordsArray[i])
            }
        }
        schoolName.dataList = arrayOfSchools
        */
    }
    
    
    func processFile(at url: URL) throws{
        let s = try String(contentsOf: url)
        try process(string: s)
    }
    
    
    @IBAction func deleteSchool(_ sender: Any) {
        aDelegate.deletingSchool(index: index)
    }
    
    func addDoneButton(){
        let doneToolbar3: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar3.barStyle = .default
        
        let flexSpace3 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done3: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction3))
        let cancel3: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(self.cancelButtonAction3))
        done3.tintColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        cancel3.tintColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        let items3 = [cancel3, flexSpace3, done3]
        doneToolbar3.items = items3
        doneToolbar3.sizeToFit()
        
        endDate.inputAccessoryView = doneToolbar3
        
        let doneToolbar4: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar4.barStyle = .default
        
        let flexSpace4 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done4: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction4))
        let cancel4: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(self.cancelButtonAction4))
        done4.tintColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        cancel4.tintColor = UIColor(displayP3Red: 13.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        let items4 = [cancel4, flexSpace4, done4]
        doneToolbar4.items = items4
        doneToolbar4.sizeToFit()
        
        startDate.inputAccessoryView = doneToolbar4
    }
    
    @objc func doneButtonAction3(){
        keyboardView.getData()
        endDate.resignFirstResponder()
    }
    
    @objc func cancelButtonAction3(){
        endDate.resignFirstResponder()
    }
    
    @objc func doneButtonAction4(){
        keyboardView.getData()
        startDate.resignFirstResponder()
    }
    
    @objc func cancelButtonAction4(){
        startDate.resignFirstResponder()
    }
    
    func keyWasTapped(date: String) {
        NSLog(date)
        if isStart{
            startDate.text = date
            startDate.inputView = nil
            startDate.reloadInputViews()
            startDate.endEditing(true)
            isStart = false
            
            startDate.inputView = keyboardView
            
            keyboardView.datePicker.aYear = keyboardView.datePicker.year
            keyboardView.datePicker.commonSetup1()
            endDate.inputView = keyboardView
        }
        
        if isEnd{
            endDate.text = date
            endDate.inputView = nil
            endDate.reloadInputViews()
            endDate.endEditing(true)
            
            endDate.inputView = keyboardView
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

extension AddSchoolTableViewCell: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        var aPoint = CGPoint(x: 0, y: 20)
        
        if textField == self.degree{
            aPoint.y = self.degreeStack.frame.origin.y
        }
        
        if textField == self.areaOfStudy{
            aPoint.y = self.areaOfStudyStack.frame.origin.y
        }
        
        if textField == self.startDate{
            aPoint.y = self.startDateStack.frame.origin.y
        }
        
        if textField == self.city{
            aPoint.y = self.cityStack.frame.origin.y
        }
        
        aPoint.y = CGFloat(Int(aPoint.y) + (self.index * Int(self.frame.height)))
        self.aDelegate.startedEditing(y: Int(aPoint.y))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

