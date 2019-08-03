//
//  Node.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/2/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import Foundation

class Node{
    var headerFront: String = "<!DOCTYPE HTML><html><head><meta charset=\"utf-8\"><meta content=\"width=device-width, initial-scale=0.4, maximum-scale=1.0\" name=\"viewport\">"
    var cssLink: String = "<link rel=\"stylesheet\" type=\"text/css\" href=\"traditional.css\">"
    var headerEndToBody: String = "</head><body><div id=\"wrapper\">"
    var nameLine: String = "<h2 id=\"name\">Logan Fitzpatrick</h2>"
    var afterNameLine: String = " <div id=\"contact-box\"><h2>Contact</h2>"
    var numberAndEmailLine: String = "<p>209-879-3308 <br> logan@gmail.com</p>"
    var afterNumberAndEmailLine: String = " </div><div id=\"objective-box\"><h2>Objective</h2>"
    var objectiveLine: String = "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Le quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat sum de lavi pu ser sire.</p>"
    var afterObjectiveLine: String = "</div>"
    var educationHeader: String = "<div id=\"education-box\"><h2>Education</h2>"
    var educationOne: String = " <h3>Penn State University <span id=\"date\">• September 2013 – May 2018</span></h3><p>Computer Science, B.A.</p>"
    var educationFooter: String = "</div>"
    
    var tmpEducation: String = " <h3>Penn State University <span id=\"date\">• September 2013 – May 2018</span></h3><p>Computer Science, B.A.</p>"
    var workExperienceHeader: String = "<div id=\"work-box\"><h2>Work Experience</h2>"
    var workExperience1: String = "<h3>Air Breather, Google <span id=\"date\">• March 2017 – Present</span></h3><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>"
    
    var tmpWorkExperience: String = "<h3>Air Breather, Google <span id=\"date\">• March 2017 – Present</span></h3><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>"
    var workExperienceFooter: String = "</div>"
    var skillsHeader: String = "<div id=\"skills-box\"><h2>Skills</h3><ul>"
    var skill1: String = "<li>Word</li>"
    var tmpSkill: String = "<li>Word</li>"
    var skillsFooter: String = "</ul></div></wrapper></body></html>"
    
    var combinedHTML: String! = ""
    
    var cssStyles: [String] = ["column.css", "red.css", "roboto.css", "traditional.css"]
    
    init(){
        runHTMLAppend()
    }
    
    func runHTMLAppend(){
        combinedHTML = ""
        combinedHTML.append(headerFront)
        combinedHTML.append(cssLink)
        combinedHTML.append(headerEndToBody)
        combinedHTML.append(nameLine)
        combinedHTML.append(afterNameLine)
        combinedHTML.append(numberAndEmailLine)
        combinedHTML.append(afterNumberAndEmailLine)
        combinedHTML.append(objectiveLine)
        combinedHTML.append(afterObjectiveLine)
        combinedHTML.append(educationHeader)
        combinedHTML.append(educationOne)
        combinedHTML.append(educationFooter)
        combinedHTML.append(workExperienceHeader)
        combinedHTML.append(workExperience1)
        combinedHTML.append(workExperienceFooter)
        combinedHTML.append(skillsHeader)
        combinedHTML.append(skill1)
        combinedHTML.append(skillsFooter)
    }
    
    func setFirstName(name: String){
        nameLine = nameLine.replacingOccurrences(of: "Logan Fitzpatrick", with: name)
        
        runHTMLAppend()
    }
    
    func setLastName(name: String){
        nameLine = nameLine.replacingOccurrences(of: "Fitzpatrick", with: name)
        
        runHTMLAppend()
    }
    
    func setNumber(number: String){
        numberAndEmailLine = numberAndEmailLine.replacingOccurrences(of: "209-879-3308", with: number)
        
        runHTMLAppend()
    }
    
    func setEmail(email: String){
        numberAndEmailLine = numberAndEmailLine.replacingOccurrences(of: "logan@gmail.com", with: email)
        
        runHTMLAppend()
    }
    
    func setObjective(objective: String){
        objectiveLine = objectiveLine.replacingOccurrences(of: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Le quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat sum de lavi pu ser sire.", with: objective)
        
        runHTMLAppend()
    }
    
    func setInstitution(institution: String){
        educationOne = educationOne.replacingOccurrences(of: "Penn State University", with: institution)
        
        runHTMLAppend()
    }
    
    func setInstitutionDate(date: String){
        educationOne = educationOne.replacingOccurrences(of: "September 2013 – May 2018", with: date)
        
        runHTMLAppend()
    }
    
    func setDegree(degree: String){
        educationOne = educationOne.replacingOccurrences(of: "Computer Science, B.A.", with: degree)
        
        runHTMLAppend()
    }
    
    func setCompany(company: String){
        workExperience1 = workExperience1.replacingOccurrences(of: "Air Breather, Google ", with: company)
        
        runHTMLAppend()
    }
    
    func setCompanyDate(date: String){
        workExperience1 = workExperience1.replacingOccurrences(of: "March 2017 – Present", with: date)
        
        runHTMLAppend()
    }
    
    func setCompanySubHeader(sub: String){
        workExperience1 = workExperience1.replacingOccurrences(of: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", with: sub)
        
        runHTMLAppend()
    }
    
    func setSkill(skill: String){
        skill1 = skill1.replacingOccurrences(of: "Word", with: skill)
        
        runHTMLAppend()
    }
    
    func addWorkExperience(company: String, date: String, sub: String){
        var anExperience = tmpWorkExperience
        anExperience = anExperience.replacingOccurrences(of: "Air Breather, Google ", with: company)
        anExperience = anExperience.replacingOccurrences(of: "March 2017 – Present", with: date)
        anExperience = anExperience.replacingOccurrences(of: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", with: sub)
        
        workExperience1.append(anExperience)
        
        runHTMLAppend()
    }
    
    func addSkill(skill: String){
        var aSkill: String = tmpSkill
        aSkill = aSkill.replacingOccurrences(of: "Word", with: skill)
        skill1.append(aSkill)
        
        runHTMLAppend()
    }
    
    func addInstitution(institution: String, date: String, degree: String){
        
        var aEducation: String = tmpEducation
        aEducation = aEducation.replacingOccurrences(of: "Penn State University", with: institution)
        aEducation = aEducation.replacingOccurrences(of: "September 2013 – May 2018", with: date)
        aEducation = aEducation.replacingOccurrences(of: "Computer Science, B.A.", with: degree)
        
        educationOne.append(aEducation)
        
        
        runHTMLAppend()
        
    }
    
    func setCSS(css: Int){
        cssLink = cssLink.replacingOccurrences(of: "traditional.css", with: cssStyles[css])
        
        runHTMLAppend()
    }
    
    
    
}
