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
                Text("add course")
                    .onTapGesture {
                        print("toggle")
                        self.open.toggle()
                    }
                HStack{
                   Spacer()
                    
                    
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
                                   Text("Add All Courses. Please do not complete this action without approval.")
                               }
                               //.buttonStyle(GrowingButton)
                    
                    
                    
                }
                Spacer()
                
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
                        .onTapGesture {
                            self.open.toggle()
                        }
                    
                }
            }
            .padding(.top, 40)
            HStack{
                Text("Class Name")
                    .padding()
                Spacer()
                TextField("Class Name", text: $className)
                .cornerRadius(5.0)
                .padding()
              Spacer()
            }
            HStack{
                
                
                Text("Description")
                    .padding()
                TextField("Description", text: $description)
                .padding()
                .cornerRadius(5.0)
                .padding()
                
            }
            HStack{
                
                Text("Prerequisites")
                    .padding()
                TextField("Prerequisites, input \"None\" for none.", text: $preR)
                    .lineLimit(5)
                    .padding()
                .cornerRadius(5.0)
                .padding()
                Spacer()
            
            }
            HStack{
                
                Text("Department: \(department)")
                    .padding()
                .cornerRadius(5.0)
                .padding()
                let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
                ScrollView{
                ForEach(departmentList, id: \.self){ c in
                      Text(c)
                        .overlay(Capsule())
                       .cornerRadius(5)
                       .onTapGesture {
                           department = c
                       }
                }
               
                }.frame(width: 100, height: 30)
                Spacer()
                
            }
            
           // Spacer()
            Button {
                print(description)
                print(className)
                print(preR)
                print(department)
           //     bigData.addClass(name: className, prerequisites: preR, description: description, department: "")
            }label:{
                Text("Done")
                    .foregroundColor(.white)
                
            }
            Spacer()
           
        }
                .padding(.vertical, 30)
                .background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom))
                .offset(y: open ? 80 : UIScreen.main.bounds.height)
                .animation(.spring())
                .edgesIgnoringSafeArea(.vertical)
                .cornerRadius(20)
            
        
        }
        
    }
    
}
