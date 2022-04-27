//
//  FirstPage.swift
//  ClassRank
//
//  Created by 90310266 on 4/25/22.
//

import SwiftUI

struct FirstPage: View {
    
    @EnvironmentObject var clickedIndex: GlobalVariables
    @AppStorage("colorPallette") private var color = 0
    
    
    var body: some View {
        VStack{
//            HStack{
//                Spacer()
//                HStack{
//                Text("Skip").foregroundColor(Color(red: 0.035, green: 0.098, blue: 0.159)).bold()
//                Image(systemName: "arrow.right").foregroundColor(darkBlue)
//                }.padding(.horizontal)
//            }
            ZStack{
                Rectangle().aspectRatio(1, contentMode: .fit).cornerRadius(5).padding(50).shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 5).cornerRadius(5).foregroundColor(Color(red: 0.8666666666666667, green: 0.9176470588235294, blue: 0.9529411764705882)).overlay{
                    
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 50, height: 50)
                        .padding()
                        .aspectRatio(1.0, contentMode: .fit)
                    //Probably add image ilogo here
                }
            }
            
            Text("Welcome to ClassRate.")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(GlobalVar.colorList[color])
                .padding(.bottom)
                
            Text("To get started, navigate through the departments to choose your desired class")
                .padding([.leading, .trailing], 40)
            
                
           /* HStack{
                Button(action: {
                    clickedIndex.indexClicked = 3
                }){
                    Text("Skip").bold()
                }
                Image(systemName: "arrow.right")
                    .foregroundColor(GlobalVar.colorList[color])
            }.padding()*/
        }.multilineTextAlignment(.center)
    }

}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
