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
    @StateObject var bigData = CloudDataViewModel()
    
    var body: some View {
        if loggedIn{
            GuestToggle()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(bigData)
        } else if isGuest{
            GuestToggle()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(bigData)
        } else if isGuest == false{
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(bigData)
        }
        else{
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(bigData)
        }
        
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
