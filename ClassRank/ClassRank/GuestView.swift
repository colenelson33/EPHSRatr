//
//  GuestView.swift
//  ClassRank
//
//  Created by 90304588 on 3/28/22.
//

import SwiftUI

struct GuestView: View {
    var body: some View {
        NavigationView{
            HStack {
                VStack(alignment: .leading, spacing:30 ){
                    
                    Button {
                        print("Clicked")
                    } label: {
                        Text("Math")
                    }.buttonStyle(GrowingBlockRedButton())
                        
                   
                    Button {
                        print("Clicked")
                    } label: {
                        Text("English")
                    }.buttonStyle(GrowingBlockWhiteButton())
                    
                    Button {
                        print("Clicked")
                    } label: {
                        Text("Language")
                    }.buttonStyle(GrowingBlockRedButton())
                    
                    Button {
                        print("Clicked")
                    } label: {
                        Text("Art")
                    }.buttonStyle(GrowingBlockWhiteButton())
                    
                    Button {
                        print("Clicked")
                    } label: {
                        Text("FACS")
                    }.buttonStyle(GrowingBlockRedButton())
                    
                    Button {
                        print("Clicked")
                    } label: {
                        Text("Tech Ed")
                    }.buttonStyle(GrowingBlockWhiteButton())
                    Spacer()
                    Spacer()
                    
                }
                VStack(alignment: .trailing, spacing: 30){
                    
                    Button {
                        print("Clicked")
                    } label: {
                        Text("Science")
                    }.buttonStyle(GrowingBlockRedButton())
                    
                   
                    Button {
                        print("Clicked")
                    } label: {
                        Text("Social Studies")
                    }.buttonStyle(GrowingBlockWhiteButton())
                        
                    Button {
                        print("Clicked")
                    } label: {
                        Text("Business")
                    }.buttonStyle(GrowingBlockRedButton())
                    
                    Button {
                        print("Clicked")
                    } label: {
                        Text("Music")
                    }.buttonStyle(GrowingBlockWhiteButton())
                    
                    Button {
                        print("Clicked")
                    } label: {
                        Text("Phy Ed/Health")
                    }.buttonStyle(GrowingBlockRedButton())
                    
                    Button {
                        print("Clicked")
                    } label: {
                        Text("Work Experience")
                    }.buttonStyle(GrowingBlockWhiteButton())
                    Spacer()
                    Spacer()
                }
            }
        }
        
    }
}
struct GrowingBlockRedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 20)
           
            .frame(width: 125, height: 75)
            .background(Color.red)
            
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct GrowingBlockWhiteButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 20)
            .frame(width: 150, height: 100)
            .background(Color.white)
            .foregroundColor(.red)
            .overlay(Capsule(style: .continuous)
                .stroke(Color.red, lineWidth: 5))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct GuestView_Previews: PreviewProvider {
    static var previews: some View {
        GuestView()
    }
}
