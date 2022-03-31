//
//  IndividualClassView.swift
//  ClassRank
//
//  Created by 90304588 on 3/31/22.
//


import Foundation
import SwiftUI


struct IndividualClassView: View {
    
    var currentClass: ClassData
    
    var body: some View {
        VStack{
            Text(currentClass.averageGrade)
            Text(currentClass.className)
        }
    }
}
