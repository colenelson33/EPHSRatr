//
//  ClassData.swift
//  ClassRank
//
//  Created by 90304588 on 3/29/22.
//

import Foundation

class ClassData: Decodable, Identifiable {
    
    var className: String
    var averageGrade: String
    init(className: String, averageGrade: String){
        self.className = className
        self.averageGrade = averageGrade
    }
}


