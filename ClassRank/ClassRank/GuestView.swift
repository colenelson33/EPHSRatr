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
                    
                }.buttonStyle(GrowingBlockButton())
                    
                
                
                
                
            }
        }
    }
}
struct GrowingBlockButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 150, height: 150)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct GuestView_Previews: PreviewProvider {
    static var previews: some View {
        GuestView()
    }
}
