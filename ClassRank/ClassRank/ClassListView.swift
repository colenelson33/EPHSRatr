//
//  ClassListView.swift
//  ClassRank
//
//  Created by 90304588 on 3/30/22.
//

import Foundation
import SwiftUI

struct MathClass: View{
    
    var currentClass: ClassData
    
    var body: some View{
        VStack{
            Text(currentClass.className)
            Text(currentClass.averageGrade)
            //Text(currentClass.)
        }
        
    }
}


