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
        
        NavigationView{
        
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
                    //Text("Login succeeded!")
                    Button(action: {
                    }) {
                        NavigationLink(destination: GuestView()) {
                            Text("Continue")
                        }
                    }
                        .font(.headline)
                        .frame(width: 250, height: 80)
                        .background(Color.green)
                        .cornerRadius(30.0)
                        .foregroundColor(.white)
                   
                        //.animation(Animation.default)
                   
                }
                
                
                Button {
                    
                    /*let trimmedUser = username.trimmingCharacters(in: .whitespacesAndNewlines)
                    let sub = trimmedUser.prefix(3)
                    print(sub)
                    for ch in trimmedUser{
                        if ch.isLetter {
                            authenticationDidFail = true
                        }else{
                        
                            if trimmedUser.count != 8{
                                authenticationDidFail = true
                            }else if sub == "903" || sub == "604" {
                                authenticationDidSucceed = true
                                authenticationDidFail = false
                            }
                        }
                    }
                    */
                    authenticationDidFail = checkUserFailed(user: username)
                    authenticationDidSucceed = checkUser(user: username)
                    
                    
                    
                } label: {
                    Text("Login")
                }
                .buttonStyle(GrowingButton())
                .padding(.top, 300)
                
                
            }
            .padding()
            .navigationBarBackButtonHidden(false)
        }
        .navigationBarHidden(true)
        
    }
}
}

func checkUser(user: String) -> Bool{
    let trimmedUser = user.trimmingCharacters(in: .whitespacesAndNewlines)
    let sub = trimmedUser.prefix(3)
  //  print(sub)
    for ch in trimmedUser{
        if ch.isLetter {
            return false
        }
    }
    if trimmedUser.count != 8{
                    return false
                }else if sub == "903" || sub == "604" {
                    return true
                }

    return false
}

func checkUserFailed(user: String) -> Bool{
    let trimmedUser = user.trimmingCharacters(in: .whitespacesAndNewlines)
    let sub = trimmedUser.prefix(3)
  //  print(sub)
    for ch in trimmedUser{
        if ch.isLetter {
            return true
        }
    }
    if trimmedUser.count != 8{
                    return true
                }else if sub == "903" || sub == "604" {
                    return false
                }

    return false
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
         //   .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    
    }
}
