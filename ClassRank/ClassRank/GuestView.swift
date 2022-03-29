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
            VStack{
                
                Button {
                    print("Clicked")
                } label: {
                    Text("Math")
                }.buttonStyle(GrowingBlockRedButton())
                    .position(x: 110, y: -20)
               
                Button {
                    print("Clicked")
                } label: {
                    Text("English")
                }.buttonStyle(GrowingBlockWhiteButton())
                    .position(x: 110, y: -220)
                
            }
        }
    }
}
struct GrowingBlockRedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 150, height: 100)
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
            .padding()
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
