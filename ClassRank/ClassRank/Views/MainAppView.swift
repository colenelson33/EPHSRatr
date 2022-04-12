//
//  MainAppView.swift
//  ClassRank
//
//  Created by 90304588 on 4/7/22.
//

import SwiftUI

struct MainAppView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isLoggedIn") var loggedIn = false
    @AppStorage("isGuest") var isGuest = false
    @AppStorage("isDepartmentView") var isDepartmentView = true
    
    var body: some View {
        if loggedIn{
            GuestToggle()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        } else if isGuest{
            GuestToggle()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        } else if isGuest == false{
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        else{
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
