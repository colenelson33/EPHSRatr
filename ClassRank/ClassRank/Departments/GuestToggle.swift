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
    
    var body: some View {
        
        if isDepartmentView{
            BlurryBackGroundView()
           
        }else{
            ClassListView(currentClass: GlobalVar.ios2)
        }
    }
}

struct GuestToggle_Previews: PreviewProvider {
    static var previews: some View {
        GuestToggle()
    }
}
