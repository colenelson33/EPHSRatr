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
                HStack{
                    Text("Eagle Red")
                        
                        
                    
                }.tag(0)
                
                HStack{
                    Text("Icy Blue")
                        
                        .padding(53.5)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.tag(1)
                HStack{
                    Text("Pretty in Pink")
                        
                        .padding(30)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.tag(2)
                HStack{
                    Text("Purple Explosion")
                        
                        .padding(15)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.tag(3)
                HStack{
                    Text("Forest Green")
                        
                        .padding(33)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.tag(4)
                HStack{
                    Text("Rusty Orange")
                        
                        .padding(30)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.tag(5)
                
                
                
                
                
            }.pickerStyle(.inline)
                    .padding()
                
            }
            Spacer()
            
            Button(action: {
                
                
            }) {
                Text("Purchase Colors")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(GlobalVar.colorList[color])
                    .cornerRadius(30.0)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            
        }.navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(false)
        
     /*   .toolbar{
            
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button(action: {
                }) {
                    NavigationLink(destination: OtherGuestView()) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(GlobalVar.colorList[color])
                    }
                }
            }
            
        }*/
    }
}

struct ModeSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        ModeSwitchView()
    }
}
