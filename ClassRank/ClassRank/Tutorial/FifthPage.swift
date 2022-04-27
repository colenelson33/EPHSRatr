//
//  FifthPage.swift
//  ClassRank
//
//  Created by 90310266 on 4/27/22.
//

import SwiftUI

struct FifthPage: View {
    @AppStorage("colorPallette") private var color = 0
    @EnvironmentObject var clickedIndex: GlobalVariables
    
    @State var darkBlue = Color(red: 0.0, green: 0.4392156862745098, blue: 0.7529411764705882, opacity: 1.0)
    @State var gray = Color(red: 0.8980392156862745, green: 0.8980392156862745, blue: 0.8980392156862745)
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle().aspectRatio(1, contentMode: .fit).cornerRadius(5).padding(50).shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 5).cornerRadius(5).foregroundColor(Color(red: 0.8666666666666667, green: 0.9176470588235294, blue: 0.9529411764705882)).overlay{
                    
                    Image(systemName: "photo").resizable()
                        .foregroundColor(Color.gray).frame(width: 50, height: 50).padding().aspectRatio(1.0, contentMode: .fit)
                    
                }
            }
            
            Text("Login")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(GlobalVar.colorList[color])
                .padding(.bottom)
            Text("Continue with Apple for the ability to input grades, homework, and personal insights on each class. The more information you are able to provide, the more accurate representation each class will have")
                .padding([.leading, .trailing], 40)
            
            
            /*HStack{
                Button(action: {
                    clickedIndex.indexClicked = 3
                    //Test API Here
                    
                    clickedIndex.tutorialSkipped = true
                   
                    UserDefaults.standard.set(true, forKey: "hasDoneTut")
                    clickedIndex.isPresented = false
                    
                    
                }){
                    Text("Done").bold()
                }
                Image(systemName: "arrow.right").foregroundColor(.red)
            }.padding()*/
        }.multilineTextAlignment(.center)
    }
    
    
    
}

struct FifthPage_Previews: PreviewProvider {
    static var previews: some View {
        FifthPage()
    }
}