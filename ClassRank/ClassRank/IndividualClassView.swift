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
        level = "Maximum"
    }else if grade > 90{
        level = "Easy"
    }else{
        level = "Average"
    }
    return level
}

struct IndividualClassView: View {
    
    
    
    @AppStorage("isLoggedIn") var loggedIn = true
    @AppStorage("isGuest") var isGuest = false
    @AppStorage("isDepartmentView") var isDepartmentView = true
    
    var currentClass: ClassData
    @State var sliderGValue: Double
    @State var sliderHValue: Double

    @State private var speed = 50.0
    @State private var isEditing = false
    @State var showPopUp: Bool = false
    @State var showPrePopUp: Bool = false
    
    
    
    

    
    
    var body: some View {
        
        
        
        let difficultLevel = setDifficulty(grade: currentClass.averageGrade)
        let tipText: String = String(format: "%.1f", currentClass.averageGrade)
        
        
    
        
        NavigationView{
            ScrollView{
            ZStack {
                TeacherWindow(title: "Teacher Info", message: "Email: jennelson@edenpr.org", buttonText: "D O N E", show: $showPopUp)
                    .zIndex(100.0)
                
                PreWindow(title: "Prerequisites", message: currentClass.prerequisite, buttonText: "D O N E", show: $showPrePopUp)
                    .zIndex(100.0)
                VStack{
                    
                    VStack{
                        Spacer()
                        Text(currentClass.className)
                            .font(.title)
                        Text(currentClass.description)
                            .font(.subheadline)
                            .padding()
                        Spacer()
                        //Text("Teacher(s): \(currentClass.Teacher)")
                        //.font(.title2)
                        Spacer()
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 12){
                                Cards(txt: "Teacher(s)", activity: "Tap for info", sysimages: "figure.wave", opacityVal: 0.9, cardIndex: 0, showPopUp: $showPopUp, showPrePopUp: $showPrePopUp)
                                    
                                Cards(txt: "Prerequisites", activity: "Tap for Info", sysimages: "gobackward", opacityVal: 0.9, cardIndex: 1, showPopUp: $showPopUp, showPrePopUp: $showPrePopUp)
                                    
                                
                                Cards(txt: "Difficulty", activity: difficultLevel, sysimages: "flame", opacityVal: 0.9, cardIndex: 2, showPopUp: .constant(false), showPrePopUp: .constant(false))
                                  
                            }
                        }.padding()
                        
                        
                        
                        Spacer()
                        VStack{
                            if(loggedIn == true) {
                                Slider(value: $sliderGValue, in: 0...100){
                                
                                    Text("Speed")
                                } minimumValueLabel: {
                                    Text("0")
                                } maximumValueLabel: {
                                    Text("100")
                                } onEditingChanged: { editing in
                                    isEditing = editing
                                }

                                .padding()
                                .disabled(false)
                                Text("Average Grade: \(tipText)%")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(isEditing ? .black : .red)
                                    .padding()
                                
                                Slider(value: $sliderHValue, in: 0...10){
                                    Text("Speed")
                                } minimumValueLabel: {
                                    Text("0")
                                } maximumValueLabel: {
                                    Text("10")
                                } onEditingChanged: { editing in
                                    isEditing = editing
                                }
                                .padding()
                                .disabled(false)
                                Text("Homework Per Night")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(isEditing ? .black : .red)
                                    .padding()
                            } else {
                                Slider(value: $sliderGValue, in: 0...100){
                                    Text("Speed")
                                } minimumValueLabel: {
                                    Text("0")
                                } maximumValueLabel: {
                                    Text("100")
                                } onEditingChanged: { editing in
                                    isEditing = editing
                                }

                                .padding()
                                .disabled(true)
                                Text("Average Grade: \(tipText)%")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(isEditing ? .blue : .red)
                                    .padding()
                                
                                Slider(value: $sliderHValue, in: 0...10){
                                    Text("Speed")
                                } minimumValueLabel: {
                                    Text("0")
                                } maximumValueLabel: {
                                    Text("10")
                                } onEditingChanged: { editing in
                                    isEditing = editing
                                }
                                .padding()
                                .disabled(true)
                                Text("Homework Per Night")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(isEditing ? .blue : .red)
                                    .padding()
                            }
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    Spacer()
                }
                

            }
        
            .navigationBarHidden(true)
        }
            
         //  .navigationBarHidden(true)
        }
       
        .navigationTitle(Text(""))
            .toolbar{
                            
                            
                            ToolbarItem(placement: .navigationBarTrailing){
                                Button(action: {
                                    withAnimation{
                                    isGuest = false
                                    loggedIn = false
                                    isDepartmentView = true
                                    }
                                }) {
                                    // NavigationLink(destination: ContentView()) {
                                    Image(systemName: "house.circle")
                                    // }
                                }
                            }
                            
                        }
    //       .navigationBarHidden(true)
        .navigationBarBackButtonHidden(false)

        
    }
    
    
    
}


struct Cards: View{
    
    @State var txt = ""
    @State var activity = ""
    @State var sysimages = ""
    @State var opacityVal : CGFloat = 0
    @State var cardIndex = 0
    
    @Binding var showPopUp: Bool
    @Binding var showPrePopUp: Bool
    
    
    
    var body: some View{
        ZStack{
           // Window(title: "yeah", message: "ok", buttonText: "Done", show: $showPopUp)
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.red)
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

struct IndividualClassView_Previews: PreviewProvider{
    
    
    static var previews: some View {
        
        IndividualClassView(currentClass: GlobalVar.apstats, sliderGValue: 0.0, sliderHValue: 0.0)
      //  Window(title: "Teacher Info", message: "Name: Jen Nelson", buttonText: "Ok", show: .constant(true))
    }
}




struct TeacherWindow: View {
    var title: String
    var message: String
    var buttonText: String
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
                .background(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
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
                .background(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
                .cornerRadius(25)
                
            }
        }
    }
}
