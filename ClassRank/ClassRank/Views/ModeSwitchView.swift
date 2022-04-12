//
//  ModeSwitchView.swift
//  ClassRank
//
//  Created by 90304588 on 4/1/22.
//

import SwiftUI

struct ModeSwitchView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    
    var body: some View {
        NavigationView{
        VStack{
            Text("Toggle Dark/Light Mode")
                .font(.largeTitle)
            Picker("Mode", selection: $isDarkMode){
                Text("Light")
                    .tag(false)
                Text("Dark")
                    .tag(true)
            }.pickerStyle(.segmented)
                .padding()
            Spacer()
        }.navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        
        .toolbar{
            
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button(action: {
                }) {
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "chevron.backward")
                    }
                }
            }
            
        }
    }
}

struct ModeSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        ModeSwitchView()
    }
}
