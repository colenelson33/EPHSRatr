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
    var Teacher: String
    
   
    init(className: String, averageGrade: Double, Teacher: String){
        self.className = className
        self.averageGrade = averageGrade
        self.Teacher = Teacher
    }
}


