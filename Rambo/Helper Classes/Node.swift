//
//  Node.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/2/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import Foundation

class Node{
    var headerFront: String = "<!DOCTYPE HTML><html><head><meta charset=\"utf-8\"><meta content=\"width=device-width, initial-scale=0.4, maximum-scale=0.3\" name=\"viewport\">"
    var cssLink: String = "<link rel=\"stylesheet\" type=\"text/css\" href=\"logan.css\">"
    var headerEndToBody: String = "</head><body><div id=\"wrapper\">"
    var nameLine: String = "<div class=\"sections\" id=\"name-section\"><h1 id=\"name\">Luis Eduardo Giron Yuja</h1></div>"
    var basicInfoStuff: String = "<div class=\"sections\" id=\"contact-section\"><h3 class=\"section-titles\">Contact Info</h3><div id=\"email-container\"><h4 class=\"titles\">Email</h4><p>legyuja@gmail.com</p></div><div id=\"phone-container\"><h4 class=\"titles\">Phone</h4><p>209-914-8031</p></div><div id=\"link-container\"><h4 class=\"titles\">Personal Link</h4><p>www.legyuja.design</p></div><div id=\"objective-container\"><h4 class=\"titles\">Summary</h4><p>A human-centered problem solver focused in company goals by prioritizing the needs and pain-points of his clients. Company goals by prioritizing the needs and pain-points of his clients.</p></div></div>"
    var preEducation: String = "<div class=\"sections\"id=\"education-section\"><h3 class=\"section-titles\">Education</h3>"
    var educationSection: String = "<div class=\"subsection\" id=\"education-container\"><h4 class=\"titles\">San Jose State University <span class=\"date\">Aug 2016 - Dec 2017</span></h4><p><span id=\"degree\">Bachelor's</span> in <span id=\"area-of-study\">Spanish</span></p></div>"
    var preWork: String = "</div><div class=\"sections\" id=\"work-section\"><h3 class=\"section-titles\">Work Experience</h3>"
    var workSection: String = "<div class=\"subsection\" id=\"work-container\"><h4 class=\"job-title\">Product Designer at <span id=\"company\">LeadCrunch</span><span class=\"date\">Jan 2019 - Present</span></h4><p>Collaborate with sales team to grow customer segments by building stronger partnerships when enrolling and educating domestic and international organizations on Color products. Reinforce Color’s growth engine by executing support team's best practices of internal tools, processes and procedures.</p></div>"
    
    var prelimSkills: String = "</div><div class=\"sections\" id=\"skills-section\"><h3 class=\"section-titles\">Skills</h3><div id=\"work-container\"><ul>"
    var skill: String = "<li> Salesforce </li>"
    var tmpSkill: String = "<li> Salesforce </li>"
    var endlimSkills: String = "</ul></div></div></div></body></html>"
    var combinedHTML: String! = ""
    
    var cssStyles: [String] = ["logan.css", "brittany.css", "mike.css", "stephanie.css"]
    
    init(){
        runHTMLAppend()
    }
    
    func runHTMLAppend(){
        combinedHTML = ""
        combinedHTML.append(headerFront)
        combinedHTML.append(cssLink)
        combinedHTML.append(headerEndToBody)
        combinedHTML.append(nameLine)
        combinedHTML.append(basicInfoStuff)
        combinedHTML.append(preEducation)
        combinedHTML.append(educationSection)
        combinedHTML.append(preWork)
        combinedHTML.append(workSection)
        combinedHTML.append(prelimSkills)
        combinedHTML.append(skill)
        combinedHTML.append(endlimSkills)
    }
    
    func setFirstName(name: String){
        nameLine = nameLine.replacingOccurrences(of: "Luis Eduardo Giron Yuja", with: name)
        
        runHTMLAppend()
    }
    
    func setLastName(name: String){
        nameLine = nameLine.replacingOccurrences(of: "Fitzpatrick", with: name)
        
        runHTMLAppend()
    }
    
    func setNumber(number: String){
        basicInfoStuff = basicInfoStuff.replacingOccurrences(of: "209-914-8031", with: number)
        
        runHTMLAppend()
    }
    
    func setEmail(email: String){
        basicInfoStuff = basicInfoStuff.replacingOccurrences(of: "legyuja@gmail.com", with: email)
        
        runHTMLAppend()
    }
    
    func setLink(link: String){
        basicInfoStuff = basicInfoStuff.replacingOccurrences(of: "www.legyuja.design", with: link)
        
        runHTMLAppend()
    }
    
    func setObjective(objective: String){
        basicInfoStuff = basicInfoStuff.replacingOccurrences(of: "A human-centered problem solver focused in company goals by prioritizing the needs and pain-points of his clients. Company goals by prioritizing the needs and pain-points of his clients", with: objective)
        
        runHTMLAppend()
    }
    
    func addWorkExperience(company: String, position: String, date: String, sub: String, isFirst: Bool){
        if isFirst {
            workSection = workSection.replacingOccurrences(of: "Product Designer", with: position)
            workSection = workSection.replacingOccurrences(of: "LeadCrunch", with: company)
            workSection = workSection.replacingOccurrences(of: "Jan 2019 - Present", with: date)
            workSection = workSection.replacingOccurrences(of: "Collaborate with sales team to grow customer segments by building stronger partnerships when enrolling and educating domestic and international organizations on Color products. Reinforce Color’s growth engine by executing support team's best practices of internal tools, processes and procedures.", with: sub)
        } else {
            var anExperience = workSection
            anExperience = anExperience.replacingOccurrences(of: "LeadCrunch", with: company)
            anExperience = anExperience.replacingOccurrences(of: "Jan 2019 - Present", with: date)
            anExperience = anExperience.replacingOccurrences(of: "Collaborate with sales team to grow customer segments by building stronger partnerships when enrolling and educating domestic and international organizations on Color products. Reinforce Color’s growth engine by executing support team's best practices of internal tools, processes and procedures.", with: sub)
            
            workSection.append(anExperience)
        }
        
        runHTMLAppend()
    }
    
    func addSkill(aSkill: String, isFirst: Bool){
        
        
        if isFirst {
            skill = tmpSkill.replacingOccurrences(of: "Salesforce", with: aSkill)
        } else {
            var theSkill: String = tmpSkill
            theSkill = theSkill.replacingOccurrences(of: "Salesforce", with: aSkill)
            skill.append(theSkill)
        }
        
        runHTMLAppend()
    }
    
    func addInstitution(institution: String, date: String, degree: String, skillSet: String, isFirst: Bool){
        
        if isFirst{
            educationSection = educationSection.replacingOccurrences(of: "San Jose State University", with: institution)
            educationSection = educationSection.replacingOccurrences(of: "Aug 2016 - Dec 2017", with: date)
            educationSection = educationSection.replacingOccurrences(of: "Bachelor's", with: skillSet)
            educationSection = educationSection.replacingOccurrences(of: "Spanish", with: degree)
        } else {
            var aEducation: String = educationSection
            aEducation = aEducation.replacingOccurrences(of: "San Jose State University", with: institution)
            aEducation = aEducation.replacingOccurrences(of: "Aug 2016 - Dec 2017", with: date)
            aEducation = aEducation.replacingOccurrences(of: "Bachelor's", with: skillSet)
            aEducation = aEducation.replacingOccurrences(of: "Spanish", with: degree)
            
            educationSection.append(aEducation)
        }
        
        
        
        runHTMLAppend()
        
    }
    
    func setCSS(css: Int){
        cssLink = cssLink.replacingOccurrences(of: "logan.css", with: cssStyles[css])
        
        runHTMLAppend()
    }
    
    
    
}
