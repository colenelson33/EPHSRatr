//
//  GuestView.swift
//  ClassRank
//
//  Created by 90304588 on 3/28/22.
//

import SwiftUI

struct GuestView: View {
    
    
    @State private var searchText = ""
    
    var body: some View {
       
        

            
            
        NavigationView{
            
           /* VStack{
                Button(action: {
                }) {
                    NavigationLink(destination: ContentView()) {
                        Text("Home")
                    }
                }
                
                .buttonStyle(GrowingSmallButton())
                .offset(x: -150)
            */
                VStack {
                    ScrollView{
                        HStack {
                            
                            
                            Spacer()
                            VStack(alignment: .leading, spacing: 30){
                        
                        
                        Button(action: {
                        }) {
                            NavigationLink(destination: MathClass(currentClass: GlobalVar.CalcClass)) {
                                Text("Math")
                            }
                        }
                        .buttonStyle(GrowingBlockRedButton())
                        
                            
                       
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
                    Spacer()
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
                    Spacer()
                }
                    
                
                .offset(y: 15)
                .navigationTitle(Text("Departments"))
              //  .navigationBarTitleDisplayMode(.automatic)
              
                
            }.searchable(text: $searchText)
                    
                
            
           /* .navigationBarItems(
               /* leading: Button(action: {
                    NavigationLink(destination: ContentView())
                    // Actions
                    
                }, label: { Text("Button") }),
*/
                leading: Button(action: {
                // Actions
                   // NavigationLink(destination: MathClass(currentClass: GlobalVar.CalcClass))
                }, label: { Image("ephsHome")
                        .resizable()
                        .frame(width: 52, height: 50)
                        .clipShape(Circle())
           */
                }.navigationBarBackButtonHidden(true)
               // .navigationBarItems(leading: <#T##L#>, trailing: <#T##T#>)
        }
                                
    }
}
struct GrowingBlockRedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 20)
            .frame(width: 160, height: 90)
            .background(Color.red)
            
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
struct GrowingSmallButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
               // .padding(.vertical, 20)
                .frame(width: 60, height: 30)
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
            .frame(width: 160, height: 90)
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

