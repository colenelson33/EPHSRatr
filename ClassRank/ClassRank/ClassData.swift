//
//  ClassData.swift
//  ClassRank
//
//  Created by 90304588 on 3/29/22.
//

import Foundation

class ClassData: Decodable, Identifiable {
    
    var className: String
    var averageGrade: Double
    var Teacher: String?
    var credits: Int
    var prerequisite: String
    var description: String
    var averageHW: Double
    
   
    init(className: String, averageGrade: Double, Teacher: String, credits: Int, preR: String, description: String, averageHW: Double){
        self.className = className
        self.averageGrade = averageGrade
        self.Teacher = Teacher
        self.credits = credits
        self.prerequisite = preR
        self.description = description
        self.averageHW = averageHW
    }
}


