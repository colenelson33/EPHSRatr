//
//  AdminView.swift
//  ClassRank
//
//  Created by 90304588 on 5/8/22.
//

import SwiftUI

struct AdminView: View {
    @EnvironmentObject var bigData: CloudDataViewModel
    @AppStorage("colorPallette") private var color = 0
    
    @State var isPresented: Bool = false
    
    var body: some View {
        
        VStack{
            Button{
                       
                       
                            
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
                       Text("Add All Courses. Please only do this action once")
                       
                       
                   }
                   //.buttonStyle(GrowingButton)
        }.sheet(isPresented: $isPresented, content: {
            VStack{
                TabView(){
                    FirstPage()
                        .onTapGesture {
                            isPresented.toggle()
                        }
                }
                .tabViewStyle(PageTabViewStyle())
                
               
                
            }.zIndex(100)
            }
        )
    }
    
}



struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
