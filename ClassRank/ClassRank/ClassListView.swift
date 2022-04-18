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
    @AppStorage("colorPallette") private var color = 0
  
    
    
    @EnvironmentObject var bigData: CloudDataViewModel
    
    
    
    
    //var currentClass: ClassData
    
    
    var body: some View{
        
        
        
        NavigationView{
        
        List{
            .listRowBackground(Color.pink)
            ForEach(GlobalVar.DepartmentList[departmentIndex]){ c in
                
                HStack{
                    
                    Text(bigData.averageGrade(gradeList: bigData.grades.gradeList)+"%")
                        .font(.system(size: 10.0))
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding()
                        .overlay(
                            Circle()
                            .stroke(GlobalVar.colorList[color], lineWidth: 2)
                            .padding(6)
                        )
                        Spacer()
                    
                Text(c.className)
                    
                    .padding()
                    .foregroundColor(GlobalVar.colorList[color])
                    .onTapGesture {
                        bigData.classData = c
                        bigData.className = c.className
                        bigData.fetchItems()
                        toggle.toggle()
                    }
                    
                    Spacer()
                    
                Image(systemName: "flame")
                        .resizable()
                        .frame(width: 20, height: 30)
                        .foregroundColor(GlobalVar.colorList[color])
                    
                        .padding()

            }
            }
            
        }
        .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                isDepartmentView = true
                            }) {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(GlobalVar.colorList[color])
                                
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {
                                isGuest = false
                                loggedIn = false
                            }) {
                                // NavigationLink(destination: ContentView()) {
                                Image(systemName: "house.circle")
                                    .foregroundColor(GlobalVar.colorList[color])
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

struct ClassListView_Previews: PreviewProvider {
    static var previews: some View {
        ClassListView()
    }
}
