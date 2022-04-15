//
//  Toggle.swift
//  ClassRank
//
//  Created by 90304588 on 4/15/22.
//

import SwiftUI

struct Toggle: View {
    @AppStorage("e") var toggle: Bool = true
    @EnvironmentObject var bigData: CloudDataViewModel
    
    var body: some View {
        
        if toggle{
            ClassListView()
        }else{
            IndividualClassView(currentClass: bigData.classData, sliderGValue: 100, sliderHValue: 100)
        }
        
        
    }
}

struct Toggle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle()
    }
}
