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
    var nameLine: String = "<div class=\"sections\" id=\"name-section\"><h1 id=\"name\">Steve Jobs</h1></div>"
    var basicInfoStuff: String = "<div class=\"sections\" id=\"contact-section\"><h3 class=\"section-titles\">Contact Info</h3><div id=\"email-container\"><h4 class=\"titles\">Email</h4><p>stevejobs@icloud.com</p></div><div id=\"phone-container\"><h4 class=\"titles\">Phone</h4><p>123-456-7890</p></div><div id=\"link-container\"><h4 class=\"titles\">Personal Link</h4><p>www.stayhungrystayfoolish.com</p></div><div id=\"objective-container\"><h4 class=\"titles\">Summary</h4><p>A creative individual who strives for perfection to deliver the highest quality products. My contributions to my previous ventures speak for themselves.</p></div></div>"
    var preEducation: String = "<div class=\"sections\"id=\"education-section\"><h3 class=\"section-titles\">Education</h3>"
    var educationSection: String = "<div class=\"subsection\" id=\"education-container\"><h4 class=\"titles\">Reed College <span class=\"date\">1972 - 1972</span></h4><p><span id=\"degree\">Undeclared</span> in <span id=\"area-of-study\">General Studies</span></p></div>"
    var preWork: String = "</div><div class=\"sections\" id=\"work-section\"><h3 class=\"section-titles\">Work Experience</h3>"
    var tmpWorkSection: String = "<div class=\"subsection\" id=\"work-container\"><h4 class=\"job-title\">Co-Founder at <span id=\"company\">Apple</span><span class=\"date\">1976 - 2011</span></h4><p>Built Apple into the second biggest manufacturer of small computers. Pushed the company towards the future of computing with technologies like GUI, the mouse, ans fanless designs.</p></div>"
    var workSection: String = "<div class=\"subsection\" id=\"work-container\"><h4 class=\"job-title\">Co-Founder at <span id=\"company\">Apple</span><span class=\"date\">1976 - 2011</span></h4><p>Built Apple into the second biggest manufacturer of small computers. Pushed the company towards the future of computing with technologies like GUI, the mouse, ans fanless designs.</p></div>"
    
    var prelimSkills: String = "</div><div class=\"sections\" id=\"skills-section\"><h3 class=\"section-titles\">Skills</h3><div id=\"work-container\"><ul>"
    var skill: String = "<li> Enthusiasm </li>"
    var tmpSkill: String = "<li> Enthusiasm </li>"
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
        nameLine = nameLine.replacingOccurrences(of: "Steve Jobs", with: name)
        NSLog(nameLine)
        runHTMLAppend()
    }
    
    func setLastName(name: String){
        nameLine = nameLine.replacingOccurrences(of: "Fitzpatrick", with: name)
        
        runHTMLAppend()
    }
    
    func setNumber(number: String){
        basicInfoStuff = basicInfoStuff.replacingOccurrences(of: "123-456-7890", with: number)
        
        runHTMLAppend()
    }
    
    func setEmail(email: String){
        basicInfoStuff = basicInfoStuff.replacingOccurrences(of: "stevejobs@icloud.com", with: email)
        
        runHTMLAppend()
    }
    
    func setLink(link: String){
        basicInfoStuff = basicInfoStuff.replacingOccurrences(of: "www.stayhungrystayfoolish.com", with: link)
        
        runHTMLAppend()
    }
    
    func setObjective(objective: String){
        basicInfoStuff = basicInfoStuff.replacingOccurrences(of: "A creative individual who strives for perfection to deliver the highest quality products. My contributions to my previous ventures speak for themselves.", with: objective)
        
        runHTMLAppend()
    }
    
    func addWorkExperience(company: String, position: String, date: String, sub: String, isFirst: Bool){
        if isFirst {
            workSection = workSection.replacingOccurrences(of: "Co-Founder", with: position)
            workSection = workSection.replacingOccurrences(of: "Built Apple into the second biggest manufacturer of small computers. Pushed the company towards the future of computing with technologies like GUI, the mouse, ans fanless designs.", with: sub)
            workSection = workSection.replacingOccurrences(of: "Apple", with: company)
            workSection = workSection.replacingOccurrences(of: "1976 - 2011", with: date)
            
        } else {
            var anExperience = tmpWorkSection
            anExperience = anExperience.replacingOccurrences(of: "Co-Founder", with: position)
            anExperience = anExperience.replacingOccurrences(of: "Built Apple into the second biggest manufacturer of small computers. Pushed the company towards the future of computing with technologies like GUI, the mouse, ans fanless designs.", with: sub)
            anExperience = anExperience.replacingOccurrences(of: "Apple", with: company)
            anExperience = anExperience.replacingOccurrences(of: "1976 - 2011", with: date)
            
            
            workSection.append(anExperience)
        }
        
        runHTMLAppend()
    }
    
    func noSkills(){
        skill = ""
        
        runHTMLAppend()
    }
    func addSkill(aSkill: String, isFirst: Bool){
        
        
        if isFirst {
            skill = tmpSkill.replacingOccurrences(of: "Enthusiasm", with: aSkill)
        } else {
            var theSkill: String = tmpSkill
            theSkill = theSkill.replacingOccurrences(of: "Enthusiasm", with: aSkill)
            skill.append(theSkill)
        }
        
        runHTMLAppend()
    }
    
    func addInstitution(institution: String, date: String, degree: String, skillSet: String, isFirst: Bool){
        
        if isFirst{
            educationSection = educationSection.replacingOccurrences(of: "Reed College", with: institution)
            educationSection = educationSection.replacingOccurrences(of: "1972 - 1972", with: date)
            educationSection = educationSection.replacingOccurrences(of: "Undeclared", with: skillSet)
            educationSection = educationSection.replacingOccurrences(of: "General Studies", with: degree)
        } else {
            var aEducation: String = educationSection
            aEducation = aEducation.replacingOccurrences(of: "Reed College", with: institution)
            aEducation = aEducation.replacingOccurrences(of: "1972 - 1972", with: date)
            aEducation = aEducation.replacingOccurrences(of: "Undeclared", with: skillSet)
            aEducation = aEducation.replacingOccurrences(of: "General Studies", with: degree)
            
            educationSection.append(aEducation)
        }
        
        
        
        runHTMLAppend()
        
    }
    
    func setCSS(css: Int){
        cssLink = cssLink.replacingOccurrences(of: "logan.css", with: cssStyles[css])
        
        runHTMLAppend()
    }
    
    
    
}
