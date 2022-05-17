//
//  AdminView.swift
//  ClassRank
//
//  Created by 90304588 on 5/8/22.
//

import SwiftUI
import UIKit

struct AdminView: View {
    @EnvironmentObject var bigData: CloudDataViewModel
    @AppStorage("colorPallette") private var color = 0
    
   // @State var isPresented: Bool = false
    @State var open = false
    
    @State var className: String
    @State var department: String
    @State var description: String
    @State var preR: String
    
   
    
    var body: some View {
        
        ZStack{
            VStack{
                Text("Click to Add Course")
                    .font(.subheadline)
                    .frame(width: 200, height: 50)
                    .cornerRadius(20)
                    .background(GlobalVar.colorList[color])
                    .onTapGesture {
                        
                        print("toggle")
                        self.open.toggle()
                    }
                
                 Text("Make sure all the data is inputted directly, otherwise you will have to delete the course and create new one. Add about a paragraph for the description of the course and if their are no prerequisites, type in \"None\". Scroll through the list of departments and click on the one that is the closest match. To delete a course, go to its individual course page and click the trash icon, which should prompt you to delete it.")
                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height/2)
                    .background(GlobalVar.colorList[color])
                    .opacity(0.7)
                Spacer()
                    
                    /*    Button{
                            
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
                                   Text("Add All Courses. Please do not complete this action without approval.")
                               }*/
                               //.buttonStyle(GrowingButton)
               
                
            }.padding()
            
            Menu(open: $open, className: $className, description: $description, preR: $preR, department: $department)
            
        }
        
        
        
    }
    
}



struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu(open: .constant(true), className: .constant(""), description: .constant(""), preR: .constant(""), department: .constant(""))
    }
}


struct Menu: View {
    @EnvironmentObject var bigData: CloudDataViewModel
    @AppStorage("colorPallette") private var color = 0
    @State var isShowingAlert: Bool = false
    @Binding var open: Bool
    @Binding var className: String
    @Binding var description: String
    @Binding var preR: String
    @Binding var department: String
    
    var body: some View{
        
        ZStack{
        VStack{
            
            HStack{
                
                Image(systemName: open ? "arrow.down": "plus")
                
          
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .heavy))
                    .frame(width: 32, height: 32)
                    .onTapGesture {
                        self.open.toggle()
                    }
                    
                ZStack{
                    Text("Cancel")
                        .foregroundColor(.white)
                        .onTapGesture {
                            self.open.toggle()
                        }
                    
                }
            }
            .padding(.top, 40)
            HStack{
                Text("Class Name")
                    .padding()
                    .foregroundColor(.white)
                Spacer()
                TextField("Class Name", text: $className)
                .cornerRadius(5.0)
                .padding()
              Spacer()
            }
            HStack{
                
                
                Text("Description")
                    .padding()
                    .foregroundColor(.white)
                TextField("Description", text: $description)
                .padding()
                .cornerRadius(5.0)
                .padding()
                
            }
            HStack{
                
                Text("Prerequisites")
                    .padding()
                    .foregroundColor(.white)
                TextField("Prerequisites", text: $preR)
                    .lineLimit(5)
                    .padding()
                  //  .foregroundColor(.white)
                .cornerRadius(5.0)
                .padding()
                Spacer()
            
            }
            
            HStack{
                
                
                Text("Department: \(department)")
                .foregroundColor(.white)
                .cornerRadius(5.0)
                .padding()
                let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
                Spacer()
                ScrollView{
                ForEach(departmentList, id: \.self){ c in
                      Text(c)
                       
                       .cornerRadius(5)
                       .foregroundColor(.white)
                       .onTapGesture {
                           department = c
                           
                       }
                }
               
                }.frame(width: 150, height: 50, alignment: .leading)
                Spacer()
                
            }
            if department == ""{
            Text("Please selecet a department")
                    .foregroundColor(.white)
            }
            
            Spacer()
            if department != ""{
            Button {
                print(description)
                print(className)
                print(preR)
                print(department)
                self.isShowingAlert.toggle()
                
           //     bigData.addClass(name: className, prerequisites: preR, description: description, department: "")
            }label:{
                Text("Done")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .overlay(
                        Capsule()
                                .stroke(lineWidth: 2.0)
                                .foregroundColor(.white)
                                .padding()
                    )
                
            }.alert("Course added", isPresented: $isShowingAlert){
                Button("Done", role: .cancel){
                    print("confirmed")
                    bigData.addClass(name: className, prerequisites: preR, description: description, department: department)
                    DispatchQueue.main.async {
                        bigData.initFunc()
                    }
                    self.open.toggle()
                }
            }
            }
            Spacer()
           
        }
                .padding(.vertical, 30)
                .background(GlobalVar.colorList[color])
            //(LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .top, endPoint: .bottom))
                .offset(y: open ? 80 : UIScreen.main.bounds.height)
                .animation(.spring())
                .edgesIgnoringSafeArea(.vertical)
                .cornerRadius(20)

        }
        
    }
    
}
