//
//  globvars.swift
//  ClassRank
//
//  Created by 90310266 on 4/25/22.
//

import SwiftUI


class GlobalVariables: ObservableObject{
    @Published var indexClicked: Int = 0


    
    
    @Published var tutorialSkipped: Bool = false
    

    
    @Published var isShowingInfoScreen: Bool = false
    
 
    @Published var isShowingFilterScreen: Bool = false
    



struct globvars: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct globvars_Previews: PreviewProvider {
    static var previews: some View {
        globvars()
    }
}
}
