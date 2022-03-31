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
      
        NavigationView{
        
            List(GlobalVar.MathClasses){ c in
                NavigationLink(destination: IndividualClassView(currentClass: c), label: {
                    VStack{
                     //   Text(currentClass.averageGrade)
                        Text(c.className)
                    }
                })
                
    
                
                
           
            //Text(currentClass.)
        }
        }.navigationBarBackButtonHidden(true)
    }
}


