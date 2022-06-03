//
//  LoginView.swift
//  ClassRank
//
//  Created by 90304588 on 3/29/22.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") var loggedIn = false
    @AppStorage("isGuest") var isGuest = false
    @AppStorage("isDepartmentView") var isDepartmentView = false
    
    @AppStorage("isAdmin") var isAdmin = false
    
    @Binding var open: Bool
    @State var username: String
    @State var errorMessage = ""

    @State var authenticationDidSucceed: Bool = false
    @StateObject private var dataRank = CloudKitClassRank()
    @AppStorage("colorPallette") private var color = 0
   
    
    var body: some View {
        
        
        
        ZStack {
            VStack{
                Spacer()
                
                if dataRank.userName != ""{
                Text("Welcome back, \(dataRank.userName)")
                    .font(.title)
                    .foregroundColor(GlobalVar.colorList[color])
                }else{
                Text("Welcome")
                        .font(.title)
                        .foregroundColor(GlobalVar.colorList[color])
                    
                }
                Text("Login to be given admin rights")
              //  Text(dataRank.permissionStatus.description)
               // Text("is signed in: \(dataRank.isSignedInToiCloud.description.uppercased())")
           //     Text(dataRank.error)
                //Label("Login", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
                
              UsernameTextField(username: $username)
              //  UsernameTextField()
                
                if authenticationDidSucceed{
                    
                    Text("Login succeeded, go back to add or delete classes")
                }
                
                
                Button {
                   
                    if checkUser() {
                        
                        isAdmin = true
                        open = false
                    }
                    
                    
                } label: {
                    Text("Login")
                }
                .buttonStyle(GrowingButton())
                .padding(.top, 300)
                
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(false)
        }
        .padding(.vertical, 30)
    //(LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .top, endPoint: .bottom))
        .background()
        .offset(y: open ? 80 : UIScreen.main.bounds.height)
        .animation(.spring())
        .edgesIgnoringSafeArea(.vertical)
        .cornerRadius(20)
        .navigationBarHidden(true)
        
    
}
    
    func checkUser() -> Bool{
        if username != "Apcsp272"{
            return false
            
        }
        authenticationDidSucceed = true
        return true
        
    }
}






struct UsernameTextField : View {
    

@Binding var username: String
var body: some View {
return TextField("Password", text: $username)
            .padding()
         //   .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    
    }
}
