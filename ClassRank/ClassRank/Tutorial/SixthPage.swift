//
//  SixthPage.swift
//  ClassRank
//
//  Created by 90310266 on 4/27/22.
//

import SwiftUI

struct SixthPage: View {
    @AppStorage("colorPallette") private var color = 0
    @EnvironmentObject var clickedIndex: GlobalVariables
    
    @State var darkBlue = Color(red: 0.0, green: 0.4392156862745098, blue: 0.7529411764705882, opacity: 1.0)
    @State var gray = Color(red: 0.8980392156862745, green: 0.8980392156862745, blue: 0.8980392156862745)
    
    var body: some View {
        VStack{
            ZStack{
                Image("slide6")
                    .resizable()
                    .scaledToFill()
                    .padding()
                    .aspectRatio(1.0, contentMode: .fit)
            }
            
            Text("Upload Grades")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(GlobalVar.colorList[color])
                .padding(.bottom)
            Text("Once logged in, move the slider to the grade that you recieved in the class and tap the upload button. The same can be done with the homework slider.")
                .padding([.leading, .trailing], 40)
            
            
           /* HStack{
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

struct SixthPage_Previews: PreviewProvider {
    static var previews: some View {
        SixthPage()
    }
}
