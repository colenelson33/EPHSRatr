//
//  ModeSwitchView.swift
//  ClassRank
//
//  Created by 90304588 on 4/1/22.
//

import SwiftUI

struct ModeSwitchView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("colorPallette") private var color = 0
    
    
    
    var body: some View {
        NavigationView{
        VStack{
            Spacer()
            Text("Display Modes")
                .font(.largeTitle)
            Picker("Mode", selection: $isDarkMode){
                Text("Light")
                    .tag(false)
                Text("Dark")
                    .tag(true)
            }.pickerStyle(.segmented)
                .padding()
            Spacer()
            
            //[Color.iCloudBlue, Color.red, Color.pinkColor, Color.varunPurple, Color.forestGreen, Color.OrangeColor]
            Text("Color Options")
                .font(.largeTitle)
            Picker("Scheme", selection: $color){
                Text("Icy Blue")
                    .tag(0)
                Text("Eagle Red")
                    .tag(1)
                Text("Pretty in Pink")
                    .tag(2)
                Text("Purple Explosion")
                    .tag(3)
                Text("Throw up Green")
                    .tag(4)
                Text("Rusty Orange")
                    .tag(5)
                
                
            }.pickerStyle(.inline)
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
