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
 
    @AppStorage("individualView") var toggle: Bool = false
    @State var hasUpload: Bool = false
    @EnvironmentObject var bigData: CloudDataViewModel
    
    
    @State var canTap: Bool = true
    @State var sliderGValue: Double
    @State var sliderHValue: Double

    @State private var speed = 50.0
    @State private var isEditing = false
    @State var showPopUp: Bool = false
    @State var showPrePopUp: Bool = false
    
    @AppStorage("userId") var userId : String = ""
    
    
    private var isSignedIn: Bool{
        
        !userId.isEmpty
    }
    
    var body: some View {
        
        NavigationView{
        
            ScrollView{
            ZStack {
                TeacherWindow(title: "Description", message: bigData.grades.description, buttonText: "Done", show: $showPopUp)
                    .zIndex(100.0)
                
                PreWindow(title: "Prerequisites", message: bigData.grades.prerequisites, buttonText: "Done", show: $showPrePopUp)
                    .zIndex(100.0)
                VStack{
                    
                    VStack{
                        
                        
                       // Spacer()
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 12){
                                
                                Cards(txt: "Difficulty", activity: setDifficulty(grade: Double(bigData.averageGrade(gradeList: bigData.grades.gradeList))!), sysimages: "flame", opacityVal: 0.9, cardIndex: 2, showPopUp: .constant(false), showPrePopUp: .constant(false))
                                
                                Cards(txt: "Description", activity: "Tap for info", sysimages: "doc.text", opacityVal: 0.9, cardIndex: 0, showPopUp: $showPopUp, showPrePopUp: $showPrePopUp)
                                    
                                Cards(txt: "Prerequisites", activity: "Tap for Info", sysimages: "gobackward", opacityVal: 0.9, cardIndex: 1, showPopUp: $showPopUp, showPrePopUp: $showPrePopUp)
                                    
                            }
                        }.padding()
                        
                        
                        Spacer()
                        VStack{
                            
                            
                            
                            if isSignedIn {
                                
                                VStack{
                                    VStack{
                                Slider(value: $sliderGValue, in: 0.01...100){
                                    
                                } minimumValueLabel: {
                                    Text("0")
                                        .font(.system(size: 20))
                                } maximumValueLabel: {
                                    Text("100")
                                        .font(.system(size: 20))
                                } onEditingChanged: { editing in
                                    isEditing = editing }
                                .disabled(hasUpload)
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
                                            
                                        
                                    }
                                    .overlay(
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
                                        
                                        
                      
                                        
                                        //check to see if class object has already been created, if not then add a new one with the grade slider value
                                        //if class has been made, then update the grade record
                                       
                                        bigData.updateGrades(grade: bigData.grades, num: sliderGValue)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                                          //  self.bigData.initFunc()
                                            self.bigData.fetchItems()
                                        }
                            
                                        
                                        
                                    } label: {
                                        
                                        
                                    
                                        Image(systemName: "icloud.and.arrow.up")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .scaledToFill()
                                            .foregroundColor(GlobalVar.colorList[color])
                                            
                                            
                                        
                                    }.disabled(hasUpload)
                                    Spacer()

                                    
                                }
                                Spacer()
                                VStack{
                                    Slider(value: $sliderHValue, in: 0...5, step: 0.25){
                                    Text("Speed")
                                } minimumValueLabel: {
                                    Text("0")
                                        .font(.system(size: 20))
                                } maximumValueLabel: {
                                    Text("5")
                                        .font(.system(size: 20))
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
                               
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 2.0)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding()
                                    
                                    )
                                HStack{
                                    Spacer()
                             
                                    
                                    if bigData.grades.homeworkList == [0.01] {
                                        
                                        
                                        Text("No homework inputted yet")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(GlobalVar.colorList[color])
                                            .padding()
                                    }else{
                                        
                                        Text("Avg homework per night: \(bigData.averageGrade(gradeList: bigData.grades.homeworkList)) hrs")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(GlobalVar.colorList[color])
                                            .padding()
                                    }
                                    
                                    Spacer()
                                Button {
                                    
    
                                    //check to see if class object has already been created, if not then add a new one with the homework slider value
                                    //if class has been made, then update the homework record
                                    bigData.updateHomework(grade: bigData.grades, num: sliderHValue)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                                        self.bigData.fetchItems()
                                    }
                                    

                         
                                    
                                        
                                } label: {
                                    Image(systemName: "icloud.and.arrow.up")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .scaledToFill()
                                        .foregroundColor(GlobalVar.colorList[color])
                                }
                                    Spacer()
                                }
                            }
                            
                            } else {
                                
                            VStack{
                                Slider(value: $sliderGValue, in: 0...100){
                                    Text("Speed")
                                } minimumValueLabel: {
                                    Text("0")
                                        .font(.system(size: 20))
                                } maximumValueLabel: {
                                    Text("100")
                                        .font(.system(size: 20))
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
                                        .padding(.bottom, 40)
                                    
                                }else{
                                    Text("No grades inputted yet")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding(.bottom, 40)
                                }
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 2.0)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding()
                                    
                                    )
                               
                                VStack{
                                Slider(value: $sliderHValue, in: 0...5){
                                    Text("Speed")
                                } minimumValueLabel: {
                                    Text("0")
                                        .font(.system(size: 20))
                                } maximumValueLabel: {
                                    Text("5")
                                        .font(.system(size: 20))
                                } onEditingChanged: { editing in
                                    isEditing = editing
                                }
                                .padding(.top, 30)
                                .padding(.trailing, 30)
                                .padding(.leading, 30)
                                .accentColor(GlobalVar.colorList[color])
                                .foregroundColor(GlobalVar.colorList[color])
                                .disabled(true)
                              
                                if bigData.grades.homeworkList == [0.01] {
                                    
                                    
                                    Text("No homework inputted yet")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding(.bottom, 40)
                                }else{
                                    
                                    Text("Average Homework per Night: \(bigData.averageGrade(gradeList: bigData.grades.homeworkList))%")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(GlobalVar.colorList[color])
                                        .padding(.bottom, 40)
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
                    
                    
                   
                }
               // .navigationBarHidden(true)

            }
          
    
            
            }
                
                .toolbar{
            
            
                    ToolbarItem(placement: .navigationBarTrailing){
                        Text(bigData.grades.name)
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                        }
            ToolbarItem(placement: .navigationBarLeading){
                Button(action:  {
                    toggle = false
                    
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(GlobalVar.colorList[color])
                }

            }
                        
                    }
        }
        .refreshable{
            bigData.initFunc()
            bigData.fetchItems()
            
            
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
