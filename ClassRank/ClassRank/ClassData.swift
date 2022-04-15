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


