//
//  ClassData.swift
//  ClassRank
//
//  Created by 90304588 on 3/29/22.
//

import Foundation

class ClassData: Decodable, Identifiable, ObservableObject {
    
    var className: String
    var Teacher: String?
    var credits: Int
    var prerequisite: String
    var description: String
    
   
    init(className: String, Teacher: String, credits: Int, preR: String, description: String){
        self.className = className
        self.Teacher = Teacher
        self.credits = credits
        self.prerequisite = preR
        self.description = description
    }
}

extension GlobalVar{
    
    
    static let ScienceClasses = [apstats, apstats, apstats]
    
    static let advHeritageSpanish = ClassData(className: "Adv Comp&Comm Heritage Spanish A&B", Teacher: "", credits: 2, preR: "Spanish spoken in the home", description: "This course is designed for students who speak Spanish in the home and/or are fluent Spanish speakers. In this course, students are able to develop their linguistic ability in association with their written and comprehensive skills. Furthermore, emphasis is also placed on the subjects of communication and Latin American history. This course prepares students for the Bilingual Seal exam, in which they can earn college credit.")
    
    static let SocialClasses = [apstats, apstats, apstats]
    
    static let WorkExperienceClasses = [apstats, apstats, apstats]
    
    static let WorldLanguageClasses = [apstats, apstats, apstats]
    
    
}


