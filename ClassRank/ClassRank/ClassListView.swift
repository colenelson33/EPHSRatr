//
//  ClassListView.swift
//  ClassRank
//
//  Created by 90304588 on 3/30/22.
//

import Foundation
import SwiftUI

struct ClassListView: View{
    
    @AppStorage("isLoggedIn") var loggedIn = false
    @AppStorage("isGuest") var isGuest = false
    @AppStorage("isDepartmentView") var isDepartmentView = false
    @AppStorage("departmentIndex") var departmentIndex = 0
    
    @EnvironmentObject var bigData: CloudDataViewModel
        
    
    
    var currentClass: ClassData
    
   

    var body: some View{
        
        NavigationView{
            
            
        List(GlobalVar.DepartmentList[departmentIndex]){ c in
            NavigationLink(destination: IndividualClassView(currentClass: c, sliderGValue: 100, sliderHValue: 100), label: {
                    VStack{
                        //   Text(currentClass.averageGrade)
                        Text(c.className)
                            .fontWeight(.bold)
                            .padding()
                            .onTapGesture {
                                bigData.className = c.className
                                print("\(bigData.className)")
                                bigData.hasClicked = true
                                print("\(c.className)")
                                bigData.fetchItems()
                       }
                                                            
                    
            }
        }
        )
    }
        
                
            .listStyle(.insetGrouped)
            
            .navigationTitle(Text("Class List"))
            .navigationBarBackButtonHidden(false)
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
            
        }
            .navigationBarHidden(true)
           

        
     
        
        
    }
        

}


