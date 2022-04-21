//
//  MainAppView.swift
//  ClassRank
//
//  Created by 90304588 on 4/7/22.
//

import SwiftUI

struct MainAppView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("ViewMode") var viewMode = 0
    @AppStorage("guestViewMode") var guestViewMode = 0
    @AppStorage("departmentIndex") var departmentIndex: Int = 0
    
    @StateObject var bigData = CloudDataViewModel()
    
    @AppStorage("userId") var userId : String = ""
    
    
    private var isSignedIn: Bool{
        
        !userId.isEmpty
    }
    
    
    
    var body: some View {
        if isSignedIn{
            
            if viewMode == 0{
                MainDepartmentView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                    .environmentObject(bigData)
                
            }else if viewMode == 1{
                Toggle()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                    .environmentObject(bigData)
            }
                
        } else {
            
            
            if guestViewMode == 0{
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(bigData)
                
            }else if guestViewMode == 1{
                MainDepartmentView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                    .environmentObject(bigData)
            }else if guestViewMode == 2{
                ClassListView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                    .environmentObject(bigData)
            }
                
        }
       
        
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
