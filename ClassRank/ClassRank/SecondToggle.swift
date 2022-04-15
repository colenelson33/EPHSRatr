//
//  SecondToggle.swift
//  ClassRank
//
//  Created by Cole Nelson on 4/14/22.
//

import SwiftUI

struct SecondToggle: View {
    
    @AppStorage("classData") var cd: ClassData = GlobalVar.APMicro
    @AppStorage("individuals") var isIndividual = false
    var body: some View {
        if isIndividual == false{
            ClassListView()
            
        }else{
            IndividualClassView(currentClass: index, sliderGValue: 100, sliderHValue: 100)
            
        }
    }
}

struct SecondToggle_Previews: PreviewProvider {
    static var previews: some View {
        SecondToggle()
    }
}
