//
//  ContentView.swift
//  ClassRank
//
//  Created by 90304588 on 3/27/22.
//

import SwiftUI
import CloudKit
import AuthenticationServices

class CloudKitClassRank: ObservableObject{
    
    @AppStorage("iCloudLoggedIn") var iCloudLoggedIn: Bool = false
    @Published var isSignedInToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    @Published var permissionStatus: Bool = false
 
    init(){
        getICloudStatus()
        requestPermission()
        fetchiCloudUserRecordID()
    }
    
    private func getICloudStatus(){
        CKContainer.default().accountStatus { [weak self] returnedStatus, returnedError in
            DispatchQueue.main.sync {
                switch returnedStatus {
                case .couldNotDetermine:
                    self?.error = CloudKitError.iCloudAccountUnknown.rawValue
                case .available:
                    self?.isSignedInToiCloud = true
                    self?.iCloudLoggedIn = true
                case .restricted:
                    self?.error = CloudKitError.iCLoudAccountRestricted.rawValue
                case .noAccount:
                    self?.error = CloudKitError.iCloudAccountNotFound.rawValue
                default:
                    self?.error = CloudKitError.iCloudAccountUnknown.rawValue
                }
            }
        }
    }
    
    enum CloudKitError: String, LocalizedError{
        case iCloudAccountNotFound
        case iCloudAccountNotDetermined
        case iCLoudAccountRestricted
        case iCloudAccountUnknown
    }
    
    func requestPermission(){
        CKContainer.default().requestApplicationPermission([.userDiscoverability]) {[weak self] returnedStatus, returnedError in
            DispatchQueue.main.async {
                if returnedStatus == .granted {
                    self?.permissionStatus = true
                    self?.iCloudLoggedIn = true
                }else{
                    print(returnedError?.localizedDescription)
                }
                    
            }
        }
    }
    
    func fetchiCloudUserRecordID(){
        CKContainer.default().fetchUserRecordID { [weak self] returnedID, error in
            if let id = returnedID{
                self?.discoveriCloudUser(id: id)
            }
        }
    }
    
    func discoveriCloudUser(id: CKRecord.ID){
        CKContainer.default().discoverUserIdentity(withUserRecordID: id){ [weak self] returnedID, returnedError in
            DispatchQueue.main.async {
                
                if let name = returnedID?.nameComponents?.givenName{
                    self?.userName = name
                }
                
            }
        }
    }
    
}

//let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 230.0/255.0)



struct ContentView: View {
    
    
    @AppStorage("ViewMode") var viewMode = 0
    @AppStorage("guestViewMode") var guestViewMode = 0
    @EnvironmentObject var bigData: CloudDataViewModel
    @AppStorage("isDarkMode") public var isDarkMode = false
    @AppStorage("colorPallette") private var color = 0
    
    @AppStorage("email") var email : String = ""
    @AppStorage("firstName") var firstName : String = ""
    @AppStorage("lastName") var lastName : String = ""
    @AppStorage("userId") var userId : String = ""
    @EnvironmentObject var globalVariables: GlobalVariables
    
    @State private var animationAmount = 1.0
    
    private var isSignedIn: Bool{
        
        !userId.isEmpty
    }
    
    var body: some View {
        
       
        NavigationView{
            VStack{
                
                /*Button("Tap Me") {
                    // animationAmount += 1
                }
                .padding(50)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.red)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeInOut(duration: 1)
                                .repeatForever(autoreverses: false),
                            value: animationAmount
                        )
                )
                .onAppear {
                    animationAmount = 2
                }*/
            //    Given how little work that involves, it creates a remarkably attractive effect!


                
                HelloText()
        
                
                
                Spacer()
                
                Button(action: {
               
                    bigData.initFunc()
                    guestViewMode = 1
                    globalVariables.isPresented = true
                    
                }) {
                    Text("Continue as Guest")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                }
                .buttonStyle(GrowingButton())
                    //.padding(.top, 300)
            if !isSignedIn{
                
                SignInButtonView()
                        .padding(.bottom, 20)
            }
                Text("Sign in to input grades and leave reviews")
                    .padding(.bottom, 20)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    //UserImage()
                    Image("ephs")
                    
                        
                        .resizable()
                       
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 30)
                        .padding([.top, .bottom], 30)
                }
              /*  ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                    }) {
                        NavigationLink(destination: ModeSwitchView()) {
                            Image(systemName: "gear")
                                .foregroundColor(GlobalVar.colorList[color])
                        }
                    }
                }*/
                
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
    @AppStorage("colorPallette") private var color = 0
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 300, height: 50)
            .background(GlobalVar.colorList[color])
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
                .stroke(Color.iCloudBlue, lineWidth: 3))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct SignInButtonView: View{
    
    @AppStorage("isDarkMode") public var isDarkMode = false
    @AppStorage("email") var email : String = ""
    @AppStorage("firstName") var firstName : String = ""
    @AppStorage("lastName") var lastName : String = ""
    @AppStorage("userId") var userId : String = ""
    @AppStorage("iCloudLoggedIn") var iCloudLoggedIn: Bool = false
    
    var body: some View{
        

        SignInWithAppleButton(.continue) { request in
            
            request.requestedScopes = [.email, .fullName]
            
            
        } onCompletion: { result in
            
            switch result{
            case .success(let auth):
                switch auth.credential{
                case let credential as ASAuthorizationAppleIDCredential:
                    
                    //User ID
                    let userId = credential.user
                    //User Info
                    
                    let email = credential.email
                    let firstName = credential.fullName?.givenName
                    let lastName = credential.fullName?.familyName
                    
                    self.userId = userId
                    self.email = email ?? ""
                    self.firstName = firstName ?? ""
                    self.lastName = lastName ?? ""
                    self.iCloudLoggedIn = true
                    GlobalVar.email = email ?? ""
                    print(GlobalVar.email)
                    print(self.email)
                    
                default:
                    break
                    
                }
                
                
            case.failure(let error):
                print(error)
                
                
            }
            
            
        }
        .signInWithAppleButtonStyle(
            isDarkMode == true ? .white : .black
        
        )
        .frame(width: 300, height: 50)
        .clipShape(Capsule())
        
        
        
        
        
    }
    
    
}

