//
//  ContentView.swift
//  ClassRank
//
//  Created by 90304588 on 3/27/22.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 230.0/255.0)



struct ContentView: View {
   
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        
       
        NavigationView{
            VStack{
               // UserImage()
                Spacer()
                HelloText()
                Spacer()
                Button(action: {
                }) {
                    NavigationLink(destination: GuestView()) {
                        Text("Continue as Guest")
                    }
                }
                .buttonStyle(GrowingButton())
                    //.padding(.top, 300)
                Button(action: {
                }) {
                    NavigationLink(destination: LoginView(username: "")) {
                        Text("Login")
                    }
                    
                }
                .buttonStyle(GrowingWButton())
                
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    //UserImage()
                    Image("ephs")
                    
                        
                        .resizable()
                        .offset(y: 30)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 175, height: 50)
                        .padding([.top, .bottom], 30)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                    }) {
                        NavigationLink(destination: ModeSwitchView()) {
                            Image(systemName: "gear")
                        }
                    }
                }
                
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(true)
       
    
                
         
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HelloText: View {
    var body: some View {
        Image("Class Rate")
            .resizable()
            .scaledToFill()
            .frame(width: 500, height: 350)
    }
}

struct UserImage: View {
    var body: some View {
        Image("ephs")
            
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .padding([.top, .bottom], 25)
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct GrowingWButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 20)
            .frame(width: 300, height: 50)
            .foregroundColor(.red)
        
            .overlay(Capsule(style: .continuous)
                .stroke(Color.red, lineWidth: 3))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

