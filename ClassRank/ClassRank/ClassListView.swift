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

    @AppStorage("departmentIndex") var departmentIndex = 0
    @AppStorage("individualView") var toggle: Bool = false
    @AppStorage("colorPallette") private var color = 0
    @AppStorage("ViewMode") var viewMode = 0
    @AppStorage("guestViewMode") var guestViewMode = 0
    @AppStorage("userId") var userId : String = ""
  
    
    
    @EnvironmentObject var bigData: CloudDataViewModel
    
    func setText(class1: ClassData, name: String) -> String{
        
    
        
        var grade = "0.0"
        DispatchQueue.main.async{
            self.bigData.className = name
            self.bigData.classData = class1
            self.bigData.fetchItems()
            
            grade = bigData.averageGrade(gradeList: bigData.grades.gradeList)
            print(grade)
        }
       return grade
                                        
    }
    
    
    //var currentClass: ClassData
    
    
    var body: some View{
        
        
        
        NavigationView{
        
        
           
 
            List{
            ForEach(GlobalVar.DepartmentList[departmentIndex]){ c in
                
                HStack{
                    Button {
                        
                        let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
                        var count = 0
                         for eachDepartment in
                                GlobalVar.DepartmentList{
                             
                             for eachClass in eachDepartment{
                                 
                                 bigData.addClass(name: eachClass.className, prerequisites: eachClass.prerequisite, description: eachClass.description, department: departmentList[count])
                                 print("class added")
                      }
                             count+=1
                    }
                             
                             
                         
                     } label: {
                         Text("toast ur computer")
                     }
                    Spacer()
                    
                //   let grade = setText(class1: c, name: c.className)
                    Text("0%")
                        .font(.system(size: 16))
                        .frame(width: 40, height: 40, alignment: .center)
                        .padding()
                        .overlay(
                            Circle()
                            .stroke(GlobalVar.colorList[color], lineWidth: 2)
                            .padding(6)
                        )
                        
                    
                Text(c.className)
                    
                    .padding()
                    .foregroundColor(GlobalVar.colorList[color])
                    .onTapGesture {
                        
                        bigData.classData = c
                        bigData.className = c.className
                        
                        DispatchQueue.main.async {
                         
                            bigData.fetchItems()
                        }
                        
                        toggle = true
                    
                    }
                    
                    Spacer()
                    
                Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(GlobalVar.colorList[color])
                        .padding()
                        .onTapGesture {
                            
                            bigData.classData = c
                            bigData.className = c.className
                            
                            DispatchQueue.main.async {
                                
                                bigData.fetchItems()
                            }
                           
                            
                            toggle = true
                        }

            }
            }
            
        }
        .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                
                                viewMode = 0
                                guestViewMode = 1
                                
                            }) {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(GlobalVar.colorList[color])
                                
                            }
                        }
                        
                       /* ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {
                                isGuest = false
                                loggedIn = false
                            }) {
                                // NavigationLink(destination: ContentView()) {
                                Image(systemName: "house.circle")
                                    .foregroundColor(GlobalVar.colorList[color])
                                // }
                            }
                        }*/
                        
                        
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
