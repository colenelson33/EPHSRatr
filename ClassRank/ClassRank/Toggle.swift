//
//  Toggle.swift
//  ClassRank
//
//  Created by 90304588 on 4/15/22.
//

import SwiftUI

struct Toggle: View {
    @AppStorage("individualView") var toggle: Bool = false
    @EnvironmentObject var bigData: CloudDataViewModel
    
    var body: some View {
        
        if toggle == false{
            ClassListView()
        }else{
            
             let gSlider = bigData.averageGradeDouble(gradeList: bigData.grades.gradeList)
            
             let hSlider = bigData.averageGradeDouble(gradeList: bigData.grades.homeworkList)
            
            IndividualClassView(sliderGValue: gSlider, sliderHValue: hSlider)
            
        }
        
        
    }
}

struct Toggle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle()
    }
}
