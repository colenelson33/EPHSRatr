//
//  ContentView.swift
//  ClassRank
//
//  Created by 90304588 on 3/27/22.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 230.0/255.0)



struct ContentView: View {
   
    var body: some View {
        
       
        NavigationView{
            VStack{
                UserImage()
                HelloText()

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
                
                
            //Spacer()
                
                
            
                
        }.navigationBarBackButtonHidden(true)
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
            .frame(width: 400, height: 350)
    }
}

struct UserImage: View {
    var body: some View {
        Image("ephs")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
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
            .background(Color.white)
            .foregroundColor(.red)
            .overlay(Capsule(style: .continuous)
                .stroke(Color.red, lineWidth: 3))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

