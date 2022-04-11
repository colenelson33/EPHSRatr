//
//  ContentView.swift
//  ClassRank
//
//  Created by 90304588 on 3/27/22.
//

import SwiftUI
import CloudKit

class CloudKitClassRank: ObservableObject{
    
    @Published var isSignedInToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    @Published var permissionStatus: Bool = false
   // init(){
     //   getICloudStatus()
       // requestPermission()
     //   fetchiCloudUserRecordID()
   // }
    
    private func getICloudStatus(){
        CKContainer.default().accountStatus { [weak self] returnedStatus, returnedError in
            DispatchQueue.main.sync {
                switch returnedStatus {
                case .couldNotDetermine:
                    self?.error = CloudKitError.iCloudAccountUnknown.rawValue
                case .available:
                    self?.isSignedInToiCloud = true
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
    
    @StateObject private var dataRank = CloudKitClassRank()
    
    @AppStorage("isLoggedIn") var loggedIn = false
    
    @AppStorage("isDarkMode") public var isDarkMode = false
    
    @AppStorage("isGuest") var isGuest = false
    @AppStorage("isDepartmentView") var isDepartmentView: Bool = true
    
    var body: some View {
        
       
        NavigationView{
            VStack{
               
           //     Text("Welcome back, \(dataRank.userName)")
           //     Text(dataRank.permissionStatus.description)
         //       Text("is signed in: \(dataRank.isSignedInToiCloud.description.uppercased())")
         //       Text(dataRank.error)
               // UserImage()
                Spacer()
                HelloText()
                Spacer()
                Button(action: {
                    isDepartmentView = true
                    isGuest = true
                }) {
                    Text("Continue as Guest")
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
                       
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 30)
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

