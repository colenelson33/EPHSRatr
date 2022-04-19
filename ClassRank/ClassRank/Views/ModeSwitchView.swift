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
            HStack{
                
                Text("Display Mode")
                    .font(.system(size: 30))
                    .padding()
                if !isDarkMode{
                    Image(systemName: "cloud.sun")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .padding()
                        .onTapGesture {
                            withAnimation{
                            isDarkMode.toggle()
                            }
                        }
                    
                }else{
                Image(systemName: "moon.stars")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .padding()
                        .foregroundColor(Color.navy)
                        .onTapGesture {
                            withAnimation{
                            isDarkMode.toggle()
                            }
                        }
                    
                }
                
                
            }
            
           Spacer()
            
            //[Color.iCloudBlue, Color.red, Color.pinkColor, Color.varunPurple, Color.forestGreen, Color.OrangeColor]
            
            VStack{
                HStack{
            Text("Color Options")
                .font(.system(size: 30))
                .padding()
                Image(systemName: "paintpalette")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .padding()
                    .foregroundColor(GlobalVar.colorList[color])

                }
            Picker("Scheme", selection: $color){
                Text("Icy Blue")
                    .tag(0)
                Text("Eagle Red")
                    .tag(1)
                Text("Pretty in Pink")
                    .tag(2)
                Text("Purple Explosion")
                    .tag(3)
                Text("Forest Green")
                    .tag(4)
                Text("Rusty Orange")
                    .tag(5)
                
                
            }.pickerStyle(.inline)
                    .padding()
                
            }
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
                            .foregroundColor(GlobalVar.colorList[color])
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
