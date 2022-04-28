//
//  ThirdPage.swift
//  ClassRank
//
//  Created by 90310266 on 4/25/22.
//

import SwiftUI

struct ThirdPage: View {
    @AppStorage("colorPallette") private var color = 0
    @EnvironmentObject var clickedIndex: GlobalVariables
    
    @State var darkBlue = Color(red: 0.0, green: 0.4392156862745098, blue: 0.7529411764705882, opacity: 1.0)
    @State var gray = Color(red: 0.8980392156862745, green: 0.8980392156862745, blue: 0.8980392156862745)
    
    var body: some View {
        VStack{
            ZStack{
                Image("slide3")
                    .resizable()
                    .scaledToFill()
                    .padding()
                    .aspectRatio(1.0, contentMode: .fit)
            }
            
            Text("More Information")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(GlobalVar.colorList[color])
                .padding(.bottom)
            Text("Tap on the cards to learn more")
                .padding([.leading, .trailing], 40)
            
          /*  HStack{
                Button(action: {
                    clickedIndex.indexClicked = 3
                }){
                    Text("Skip").bold()
                        .foregroundColor(GlobalVar.colorList[color])
                }
                Image(systemName: "arrow.right")
                    .foregroundColor(GlobalVar.colorList[color])
            }.padding()*/
        }.multilineTextAlignment(.center)
    }
}

struct ThirdPage_Previews: PreviewProvider {
    static var previews: some View {
        ThirdPage()
    }
}
