//
//  SecondPage.swift
//  ClassRank
//
//  Created by 90310266 on 4/25/22.
//

import SwiftUI

struct SecondPage: View {
    @EnvironmentObject var clickedIndex: GlobalVariables
    
    @State var darkBlue = Color(red: 0.0, green: 0.4392156862745098, blue: 0.7529411764705882, opacity: 1.0)
    @State var gray = Color(red: 0.8980392156862745, green: 0.8980392156862745, blue: 0.8980392156862745)
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle().aspectRatio(1, contentMode: .fit).cornerRadius(5).padding(50).shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 5).cornerRadius(5).foregroundColor(Color(red: 0.8666666666666667, green: 0.9176470588235294, blue: 0.9529411764705882)).overlay{
                    
                    Image(systemName: "photo").resizable()
                        .foregroundColor(Color.gray).frame(width: 50, height: 50).padding().aspectRatio(1.0, contentMode: .fit)
                    //Probably add image ilogo here
                }
            }
            
            Text("Class Details").font(.title).fontWeight(.bold).foregroundColor(.red).padding(.bottom)
            Text("The number in the circle indicates the average grade for each class").padding([.leading, .trailing], 40)
            
            
           /* HStack{
                Button(action: {
                    clickedIndex.indexClicked = 3
                }){
                    Text("Skip").bold()
                }
                Image(systemName: "arrow.right").foregroundColor(.red)
            }.padding()*/
        }.multilineTextAlignment(.center)
    }
}

struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        SecondPage()
    }
}
