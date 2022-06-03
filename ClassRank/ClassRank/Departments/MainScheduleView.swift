//
//  MainScheduleView.swift
//  ClassRank
//
//  Created by 90304588 on 5/22/22.
//

import SwiftUI

struct MainScheduleView: View{
    
    @AppStorage("freshmanClasses") var freshman: [String] = []
    @AppStorage("sophomoreClasses") var sophomore: [String] = []
    @AppStorage("juniorClasses") var junior: [String] = []
    @AppStorage("seniorClasses") var senior: [String] = []
    
    @AppStorage("ViewMode") var viewMode = 0
    @AppStorage("guestViewMode") var guestViewMode = 0
    @AppStorage("departmentIndex") var departmentIndex: Int = 0
    @AppStorage("individualView") var toggle: Bool = false
    
    @EnvironmentObject var bigData: CloudDataViewModel
    @AppStorage("colorPallette") private var color = 0
    @State var gradeLevel = 0
    @AppStorage("currentGradeLevel") var gradeLevelCurrent: Int = 0
    @State var showGrades = false
    @State private var animationAmount = 1.0
    let grades = ["Freshman", "Sophomore", "Junior", "Senior"]
    var body: some View{
        
        
            ZStack{
                VStack(alignment: .leading){
                    
                    HStack{
                        Text("Schedule").font(.custom("Inter Regular", size: 40)).foregroundColor(GlobalVar.colorList[color])
                            .padding()
                        Spacer()
                        
                        Picker("Pick", selection: $gradeLevel){
                            Text("9th")
                                .font(.system(size: 30))
                                .foregroundColor(GlobalVar.colorList[color])
                                .tag(0)
                            Text("10th")
                                .font(.system(size: 30))
                                .foregroundColor(GlobalVar.colorList[color])
                                .tag(1)
                            Text("11th")
                                .font(.system(size: 30))
                                .foregroundColor(GlobalVar.colorList[color])
                                .tag(2)
                            Text("12th")
                                .font(.system(size: 30))
                                .foregroundColor(GlobalVar.colorList[color])
                                .tag(3)
                            
                        }
                        .font(.system(size: 30))
                        .foregroundColor(GlobalVar.colorList[color])
                        .padding(.horizontal)
                        
                    }
                   // .offset(y: -80)
                    .zIndex(200)
                    
                    
                    
                    //Ceramics Mathematics
                    HStack{
                        VStack(){
                            
                            var varList = [freshman, sophomore, junior, senior]
                          
                            
                            
                            List{
                            
                                if varList[gradeLevel].count == 0{
                                    
                                   Text("No classes added yet, navigate to the course of your liking to get started creating a schedule")
                                        .font(.subheadline)
                                        .foregroundColor(GlobalVar.colorList[color])
                                    
                                }else{
                                
                            ForEach(varList[gradeLevel], id: \.self){ className in
                               
                                
                                HStack{
                                Text(className).font(.custom("Inter Regular", size: 15)).foregroundColor(GlobalVar.colorList[color])
                                .padding()
                                
                                    Spacer()
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .onTapGesture {
                                            
                                            
                                            bigData.className = className
                                            
                                            DispatchQueue.main.async {
                                                
                                                bigData.fetchItems()
                                                
                                            }
                                            viewMode = 1
                                            guestViewMode = 2
                                            departmentIndex = 1
                                            toggle = true
                                           
                                        
                                        }
                                }
                            }.onDelete(perform: delete)
                                
                            }
                            }
                            //.onDelete(perform: delete)
                            
                            
                        }
                        Spacer()
                    }
                    
                    
                    Spacer()
                }
                .offset(y: -10)
                VStack{
                    Spacer()
                HStack{
                    Spacer()
                    EditButton()
                   // Text("Edit").font(.custom("Inter Regular", size: 20)).foregroundColor(.blue)
                        .padding()
                }
                }
            }
        
    }
    func delete(at offsets: IndexSet) {
        
        if gradeLevel == 0{
            freshman.remove(atOffsets: offsets)
        }
        else if gradeLevel == 1{
            sophomore.remove(atOffsets: offsets)
        }
        else if gradeLevel == 2{
            junior.remove(atOffsets: offsets)
        }
        else if gradeLevel == 3{
            senior.remove(atOffsets: offsets)
        }
    }
    
}

struct MainScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        MainScheduleView()
    }
}
