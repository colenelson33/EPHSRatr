//
//  ClassRankApp.swift
//  ClassRank
//
//  Created by 90304588 on 3/27/22.
//

import SwiftUI

@main
struct ClassRankApp: App {
    @StateObject var envObj = GlobalVariables()
    var body: some Scene {
        
        WindowGroup {
            
            MainAppView().environmentObject(envObj)
            
        }
    }
}
