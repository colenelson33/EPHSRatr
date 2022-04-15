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
    @AppStorage("in") var isIndividual: Bool = false
    
    @EnvironmentObject var index: ClassData
    @EnvironmentObject var bigData: CloudDataViewModel
    
    
    
    
    //var currentClass: ClassData
    
    func fetchStuff(c: ClassData){
        
        bigData.className = c.className
        print("\(bigData.className)")
        bigData.hasClicked = true
        print("\(c.className)")
        bigData.fetchItems()
        
        
    }
    
    var body: some View{
        
        
        NavigationView{
            List(GlobalVar.DepartmentList[departmentIndex]){ c in
                
                
                //NavigationLink(destination: IndividualClassView(currentClass: c, sliderGValue: 100, sliderHValue: 100), isActive: $isActive) {
                
                VStack{
                    //   Text(currentClass.averageGrade)
                    
                    
                    
                    
                    
                    NavigationLink(destination: IndividualClassView(currentClass: c, sliderGValue: 100, sliderHValue: 100)){
                        
                        Text(c.className)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.iCloudBlue)
                            
                        
                    }.onTapGesture {
                        self.fetchStuff(c: c)
                    }
                    
                }
            }
            
            
            .listStyle(.insetGrouped)
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
        .navigationTitle(Text("Class List"))
        .navigationBarBackButtonHidden(false)
        
        
    }
    
    
}





