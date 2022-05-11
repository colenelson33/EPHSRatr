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
   
    
    var body: some View {
        
        ZStack{
            VStack{
                HStack{
                   Spacer()
                    
                    Button( action: {
                        self.open.toggle()
                    }){
                        
                        Image(systemName: "line.horizontal.3")
                        imageScale(.large)
                            .padding(.horizontal, 24)
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
                        
                     //   Circle()
                       //     .stroke()
                        
                    }
                    
                }
                Spacer()
                
            }.padding()
            
            Menu(open: $open)
            
        }
        
        
    }
    
}



struct addClassView_Previews: PreviewProvider {
    static var previews: some View {
        addClassView()
        
    //    Menu(open: .constant(true))
    }
}

struct addClassView: View{
    @EnvironmentObject var bigData: CloudDataViewModel
    @State var open = false
    
    var body: some View{
        ZStack{
            VStack{
                HStack{
                   Spacer()
                    
                    Button( action: {
                        self.open.toggle()
                    }){
                        
                        Image(systemName: "line.horizontal.3")
                        imageScale(.large)
                            .padding(.horizontal, 24)
                        
                        
                     //   Circle()
                       //     .stroke()
                        
                    }
                    
                }
                Spacer()
                
            }.padding()
            
            Menu(open: $open)
            
        }
        
    }
    
    
}

struct Menu: View {
   
    @Binding var open: Bool
    var body: some View{
        
        
        VStack{
            
            HStack{
                
                Image(systemName: "gear")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .heavy))
                    .frame(width: 32, height: 32)
                ZStack{
                    Image("math")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                }
            }
            .padding(.top, 20)
            
            HStack{
                
                
                Spacer()
                
                
            }
            Spacer()
        }
        .padding(.vertical, 30)
        .background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom))
        .padding(.trailing, 80)
        .offset(x: open ? 0 : -UIScreen.main.bounds.width)
      //  .animation(.default)
        .edgesIgnoringSafeArea(.vertical)
    }
    
}
