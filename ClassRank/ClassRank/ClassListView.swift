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
                    
                    
                //   let grade = setText(class1: c, name: c.className)
                    Text("0%")
                        .font(.system(size: 10))
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
                        bigData.fetchItems()
                        toggle.toggle()
                    }
                    
                    Spacer()
                    
                Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(GlobalVar.colorList[color])
                        .padding()
                        .onTapGesture {
                            toggle.toggle()
                        }

            }
            } //.listRowBackground(Color.pink)
            
        }
        .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                               // isDepartmentView = true
                            }) {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(GlobalVar.colorList[color])
                                
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {
                                isGuest = false
                          //      loggedIn = false
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
