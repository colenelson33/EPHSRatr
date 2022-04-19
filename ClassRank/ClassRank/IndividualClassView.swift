//
//  IndividualClassView.swift
//  ClassRank
//
//  Created by 90304588 on 3/31/22.
//


import Foundation
import SwiftUI
import CloudKit


func setDifficulty(grade: Double) -> String{
    
    var level = ""
    if grade < 79 {
        level = "Challenging"
    }else if grade > 90{
        level = "Easy"
    }else{
        level = "Average"
    }
    return level
}

struct IndividualClassView: View {
    
    
    @AppStorage("colorPallette") private var color = 0
    @AppStorage("isLoggedIn") var loggedIn = true
    @AppStorage("isGuest") var isGuest = false
    @AppStorage("isDepartmentView") var isDepartmentView = true
    @AppStorage("z") var toggle: Bool = false
    @State var hasUpload: Bool = false
    @EnvironmentObject var bigData: CloudDataViewModel
    
    
    @StateObject var currentClass: ClassData
    
    @State var sliderGValue: Double
    @State var sliderHValue: Double

    @State private var speed = 50.0
    @State private var isEditing = false
    @State var showPopUp: Bool = false
    @State var showPrePopUp: Bool = false
    
    var body: some View {
        
        NavigationView{
        
            ScrollView{
            ZStack {
                TeacherWindow(title: "Description", message: currentClass.description, buttonText: "Done", show: $showPopUp)
                    .zIndex(100.0)
                
                PreWindow(title: "Prerequisites", message: currentClass.prerequisite, buttonText: "Done", show: $showPrePopUp)
                    .zIndex(100.0)
                VStack{
                    
                    VStack{
                        
                        //Text("Teacher(s): \(currentClass.Teacher)")
                        //.font(.title2)
                        Spacer()
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 12){
                                
                                Cards(txt: "Difficulty", activity: "difficultLevel", sysimages: "flame", opacityVal: 0.9, cardIndex: 2, showPopUp: .constant(false), showPrePopUp: .constant(false))
                                
                                Cards(txt: "Description", activity: "Tap for info", sysimages: "doc.text", opacityVal: 0.9, cardIndex: 0, showPopUp: $showPopUp, showPrePopUp: $showPrePopUp)
                                    
                                Cards(txt: "Prerequisites", activity: "Tap for Info", sysimages: "gobackward", opacityVal: 0.9, cardIndex: 1, showPopUp: $showPopUp, showPrePopUp: $showPrePopUp)
                                    
                            }
                        }.padding()
                        
                        
                        Spacer()
                        VStack{
                            
                            
                            if(loggedIn == true) {
                                
                                VStack{
                                Slider(value: $sliderGValue, in: 0.01...100){
                                    
                                } minimumValueLabel: {
                                    Text("0")
                                } maximumValueLabel: {
                                    Text("100")
                                } onEditingChanged: { editing in
                                    isEditing = editing
                                
                    
                                    
                                .padding(.top, 30)
                                .padding(.trailing, 30)
                                .padding(.leading, 30)
                                .accentColor(GlobalVar.colorList[color])
                                .foregroundColor(GlobalVar.colorList[color])
                                Text("Grade: \(sliderGValue, specifier: "%.2f")")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(GlobalVar.colorList[color])
                                    .padding(.bottom, 30)
                                .disabled(hasUpload)
                                }
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 2.0)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding()
                                    
                                    )
                                
                                HStack{
                                    
                                    Spacer()
                                    
                                    if bigData.grades.gradeList != [0.0]{
                                        Text("Average Grade: \(bigData.averageGrade(gradeList: bigData.grades.gradeList))%")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(GlobalVar.colorList[color])
                                            .padding()
                                    }else{
                                        
                                        Text("No grades inputted yet")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(GlobalVar.colorList[color])
                                            .padding()
                                    }
                                
                                    Spacer()
                                    Button {
                                        @AppStorage(currentClass.className) var gradeUploaded: Bool = false
                                        
                                        //check to see if class object has already been created, if not then add a new one with the grade slider value
                                        //if class has been made, then update the grade record
                                   //     Dispatch.main.asyncAfter(deadline: .now() + 5.0)
                                         
                                        if gradeUploaded == false{
                                            bigData.fetchItems()
                                        
                                        if bigData.grades.gradeList == [0.0] &&
                                            bigData.grades.homeworkList == [0.0]{
                                            
                                            bigData.addItem(name: currentClass.className, num: sliderGValue)
                                            bigData.classData = currentClass
                                            bigData.className = currentClass.className
                                            bigData.fetchItems()
                                        }else{
                                            bigData.updateGrades(grade: bigData.grades, num: sliderGValue)
                                            bigData.classData = currentClass
                                            bigData.className = currentClass.className
                                            bigData.fetchItems()
                                        }
                                        
                                        }
                                        hasUpload = true
                                        gradeUploaded = true
                                        
                                        
                                        
                                    } label: {
                                        
                                        
                                    
                                        Image(systemName: "icloud.and.arrow.up")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .scaledToFill()
                                            .foregroundColor(GlobalVar.colorList[color])
                                            
                                        
                                    }
                                    Spacer()

                                    
                                }
                                Spacer()
                                VStack{
                                Slider(value: $sliderHValue, in: 0...5, step: 0.25){
                                    Text("Speed")
                                } minimumValueLabel: {
                                    Text("0")
                                } maximumValueLabel: {
                                    Text("10")
                                } onEditingChanged: { editing in
                                    isEditing = editing
                                }
                                .padding(.top, 30)
                                .padding(.trailing, 30)
                                .padding(.leading, 30)
                                .accentColor(GlobalVar.colorList[color])
                                .foregroundColor(GlobalVar.colorList[color])
                                Text("Homework: \(sliderHValue, specifier: "%.2f") hours")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding(.bottom, 30)
                                .disabled(false)
                                .foregroundColor(GlobalVar.colorList[color])
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 2.0)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding()
                                    
                                    )
                                HStack{
                                    Spacer()
                             
                                    
                                    if bigData.grades.homeworkList == [0.0] || bigData.grades.homeworkList == [1.0]{
                                        
                                        
                                        Text("No homework inputted yet")
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                            .foregroundColor(GlobalVar.colorList[color])
                                            .padding()
                                    }else{
                                        
                                        Text("Average Homework per Night: \(bigData.averageGrade(gradeList: bigData.grades.homeworkList)) hrs")
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                            .foregroundColor(GlobalVar.colorList[color])
                                            .padding()
                                    }
                                    
                                    Spacer()
                                Button {
                                    //check to see if class object has already been created, if not then add a new one with the homework slider value
                                    //if class has been made, then update the homework record
                                    bigData.fetchItems()
                                
                                if bigData.grades.gradeList == [0.0] && bigData.grades.homeworkList == [0.0]{
                                    bigData.addItemHW(name: currentClass.className, num: sliderHValue)
                                    bigData.classData = currentClass
                                    bigData.className = currentClass.className
                                    bigData.fetchItems()
                                }else{
                                    bigData.updateHomework(grade: bigData.grades, num: sliderHValue)
                                    
                                    bigData.classData = currentClass
                                    bigData.className = currentClass.className
                                    bigData.fetchItems()
                                    //toggle.toggle()
                                }
                                    
                                        
                                } label: {
                                    Text("Upload HW")
                                        .foregroundColor(GlobalVar.colorList[color])
                                }
                                    Spacer()
                                }
                            } else {
                                
                            VStack{
                                Slider(value: $sliderGValue, in: 0...100){
                                    Text("Speed")
                                } minimumValueLabel: {
                                    Text("0")
                                } maximumValueLabel: {
                                    Text("100")
                                } onEditingChanged: { editing in
                                    isEditing = editing
                                }
                                .padding(.top, 30)
                                .padding(.trailing, 30)
                                .padding(.leading, 30)
                                .foregroundColor(GlobalVar.colorList[color])
                                .accentColor(GlobalVar.colorList[color])
                                .disabled(true)
                                if bigData.grades.gradeList != [0.0]{
                                    Text("Average Grade: \(bigData.averageGrade(gradeList: bigData.grades.gradeList))%")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding(.bottom, 30)
                                    
                                }else{
                                    Text("No grades inputted yet")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding(.bottom, 30)
                                }
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 2.0)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding()
                                    
                                    )
                               
                                VStack{
                                Slider(value: $sliderHValue, in: 0...10){
                                    Text("Speed")
                                } minimumValueLabel: {
                                    Text("0")
                                } maximumValueLabel: {
                                    Text("10")
                                } onEditingChanged: { editing in
                                    isEditing = editing
                                }
                                .padding(.top, 30)
                                .padding(.trailing, 30)
                                .padding(.leading, 30)
                                .accentColor(GlobalVar.colorList[color])
                                .foregroundColor(GlobalVar.colorList[color])
                                .disabled(true)
                              
                                if bigData.grades.homeworkList == [0.0] || bigData.grades.homeworkList == [1.0]{
                                    
                                    
                                    Text("No homework inputted yet")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding()
                                }else{
                                    
                                    Text("Average Homework per Night: \(bigData.averageGrade(gradeList: bigData.grades.homeworkList))%")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding()
                                }
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 2.0)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding()
                                    
                                    )
                            }
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    Spacer()
                }
                

            }
        
        }        .navigationBarTitle(currentClass.className)
                .toolbar{
            
            
            ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {
                                withAnimation{
                                isGuest = false
                                loggedIn = false
                                isDepartmentView = true
                                    toggle.toggle()
                                }
                            }) {
                                // NavigationLink(destination: ContentView()) {
                                Image(systemName: "house.circle")
                                    .foregroundColor(GlobalVar.colorList[color])
                                
                                // }
                            }
                        }
            ToolbarItem(placement: .navigationBarLeading){
                Button(action:  {
                    toggle.toggle()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(GlobalVar.colorList[color])
                }

            }
                        
                    }
        }
            .navigationBarHidden(false)
        
    }
    
    
    
}


struct Cards: View{
    
    @State var txt = ""
    @State var activity = ""
    @State var sysimages = ""
    @State var opacityVal : CGFloat = 0
    @State var cardIndex = 0
    @AppStorage("colorPallette") private var color = 0
    
    @Binding var showPopUp: Bool
    @Binding var showPrePopUp: Bool
    
    
    
    var body: some View{
        ZStack{
           // Window(title: "yeah", message: "ok", buttonText: "Done", show: $showPopUp)
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(GlobalVar.colorList[color])
                        .opacity(0.8)
                        .frame(width: 180, height: 250)
                        .onTapGesture {
                            if cardIndex == 0{
                            showPopUp.toggle()
                            print($showPopUp)
                            }else if cardIndex == 1{
                                showPrePopUp.toggle()
                            }
                            
                        }
                    
                    
                    
                    
                    VStack{
                        Text(txt)
                            .font(.title)
                            .fontWeight(.regular)
                            .opacity(opacityVal)
                        Spacer().frame(height: 20)
                        Image(systemName: sysimages)
                            .font(.system(size: 60))
                            .opacity(opacityVal)
                        Spacer().frame(height: 20)
                        Text(activity)
                            .font(.title3)
                            .fontWeight(.regular)
                            .opacity(opacityVal)
        
                    }.padding()
                }
            }
            
        }
    }
    
    
}

/*struct IndividualClassView_Previews: PreviewProvider{
    
    
    static var previews: some View {
        
    //    IndividualClassView()
      //  Window(title: "Teacher Info", message: "Name: Jen Nelson", buttonText: "Ok", show: .constant(true))
    }
}
*/



struct TeacherWindow: View {
    var title: String
    var message: String
    var buttonText: String
    @AppStorage("colorPallette") private var color = 0
    @Binding var show: Bool

    var body: some View {
        ZStack {
            if show {
                // PopUp background color
                Color.black.opacity(show ? 0.8 : 0).edgesIgnoringSafeArea(.all)

                // PopUp Window
                VStack(alignment: .center, spacing: 0) {
                    Spacer()
                    Text(title)
                        //.frame(maxWidth: .infinity)
                        
                        .font(Font.system(size: 23, weight: .semibold))
                        .foregroundColor(Color.white)
                    Spacer()
                    ScrollView{
                    Text(message)
                        .multilineTextAlignment(.leading)
                        .font(Font.system(size: 16, weight: .semibold))
                        .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 25))
                        .foregroundColor(Color.white)
                    }
                    Spacer()
                    Button(action: {
                        // Dismiss the PopUp
                        withAnimation(.linear(duration: 0.3)) {
                            show = false
                        }
                    }, label: {
                        Text(buttonText)
                            .frame(maxWidth: .infinity)
                            .frame(height: 54, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(.gray)
                            .font(Font.system(size: 23, weight: .semibold))
                    }).buttonStyle(PlainButtonStyle())
                    
                }
                .frame(width: 300, height: 600)
                .background(GlobalVar.colorList[color])
                .cornerRadius(25)
                
            }
        }
    }
}


struct PreWindow: View {
    var title: String
    var message: String
    var buttonText: String
    @Binding var show: Bool
    @AppStorage("colorPallette") private var color = 0

    var body: some View {
        ZStack {
            if show {
                // PopUp background color
                Color.black.opacity(show ? 0.8 : 0).edgesIgnoringSafeArea(.all)

                // PopUp Window
                VStack(alignment: .center, spacing: 0) {
                    Spacer()
                    Text(title)
                        //.frame(maxWidth: .infinity)
                        
                        .font(Font.system(size: 23, weight: .semibold))
                        .foregroundColor(Color.white)
                    Spacer()

                    Text(message)
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 16, weight: .semibold))
                        .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 25))
                        .foregroundColor(Color.white)
                    Spacer()
                    Button(action: {
                        // Dismiss the PopUp
                        withAnimation(.linear(duration: 0.3)) {
                            show = false
                        }
                    }, label: {
                        Text(buttonText)
                            .frame(maxWidth: .infinity)
                            .frame(height: 54, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(.gray)
                            .font(Font.system(size: 23, weight: .semibold))
                    }).buttonStyle(PlainButtonStyle())
                    
                }
                .frame(width: 300, height: 600)
                .background(GlobalVar.colorList[color])
                .cornerRadius(25)
                
            }
        }
    }
}
