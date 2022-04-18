//
//  ClassListView.swift
//  ClassRank
//
//  Created by 90304588 on 3/30/22.
//

import Foundation
import SwiftUI
import CloudKit

struct ClassListView: View{
    
    @AppStorage("isLoggedIn") var loggedIn = false
    @AppStorage("isGuest") var isGuest = false
    @AppStorage("isDepartmentView") var isDepartmentView = false
    @AppStorage("departmentIndex") var departmentIndex = 0
    @AppStorage("z") var toggle: Bool = false
  
    
    
    @EnvironmentObject var bigData: CloudDataViewModel
    
    
    
    
    //var currentClass: ClassData
    
    
    var body: some View{
        
        
        
        NavigationView{
        
        List{
            ForEach(GlobalVar.DepartmentList[departmentIndex]){ c in
                
            
                Text(c.className)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.iCloudBlue)
                    .onTapGesture {
                        
                        
                        bigData.classData = c
                        bigData.className = c.className
                        bigData.fetchItems()
                        toggle.toggle()
                       
                        
                        
                    }

            }
        
        }
        .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                isDepartmentView = true
                            }) {
                                Image(systemName: "arrow.left")
                                
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {
                                isGuest = false
                                loggedIn = false
                            }) {
                                // NavigationLink(destination: ContentView()) {
                                Image(systemName: "house.circle")
                                // }
                            }
                        }
                        
                        
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Class List")
        }
        
        .navigationBarHidden(false)
            
    
    


    }

}


