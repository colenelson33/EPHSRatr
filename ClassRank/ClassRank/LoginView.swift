//
//  LoginView.swift
//  ClassRank
//
//  Created by 90304588 on 3/29/22.
//

import SwiftUI

struct LoginView: View {
    @State var username: String
    @State var errorMessage = ""
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        
        
        
        ZStack {
            VStack{
                
                //Label("Login", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
                
              UsernameTextField(username: $username)
              //  UsernameTextField()
                if authenticationDidFail {
                    Text("Not a valid Student ID.")
                        .foregroundColor(.red)
                        .offset(y: -10)
                }
                if authenticationDidSucceed {
                    Text("Login succeeded!")
                        .font(.headline)
                        .frame(width: 250, height: 80)
                        .background(Color.green)
                        .cornerRadius(30.0)
                        .foregroundColor(.white)
                        //.animation(Animation.default)
                   
                }
                Button {
                    
                    let trimmedUser = username.trimmingCharacters(in: .whitespacesAndNewlines)
                    for ch in trimmedUser{
                        if ch.isLetter {
                            authenticationDidFail = true
                        }
                    }
                    if trimmedUser.count != 8{
                        authenticationDidFail = true
                    }
                    else if trimmedUser.elementsEqual("903") == false || trimmedUser.elementsEqual("640") == false {
                        authenticationDidFail = true
                    }else {
                        authenticationDidSucceed = true
                    }
                    
                    
                    
                } label: {
                    Text("Login")
                }
                .buttonStyle(GrowingButton())
                .padding(.top, 300)
                
                
            }
            .padding()
            //.navigationBarBackButtonHidden(false)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: "")
    }
}

struct UsernameTextField : View {
@Binding var username: String
var body: some View {
return TextField("Student ID", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
