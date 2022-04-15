//
//  GuestToggle.swift
//  ClassRank
//
//  Created by 90304588 on 4/8/22.
//

import SwiftUI

struct GuestToggle: View {
    
    @AppStorage("isDepartmentView") var isDepartmentView: Bool = false
    @AppStorage("departmentIndex") var departmentIndex: Int = 0
    @AppStorage("in") var isIndividual = false
    
    var body: some View {
        
        if isDepartmentView{
            BlurryBackGroundView()
           
        }else{
            Toggle()
        }
    }
}

struct GuestToggle_Previews: PreviewProvider {
    static var previews: some View {
        GuestToggle()
    }
}
