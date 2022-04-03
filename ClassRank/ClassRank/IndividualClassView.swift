//
//  IndividualClassView.swift
//  ClassRank
//
//  Created by 90304588 on 3/31/22.
//


import Foundation
import SwiftUI


struct IndividualClassView: View {
    
    var currentClass: ClassData
    @State var sliderValue: Double
    
    
    var body: some View {
        
        let tipText: String = String(format: "%.1f", currentClass.averageGrade)
        //let startingValue = currentClass.averageGrade
        //$sliderValue = startingValue
        NavigationView{
            
            VStack{
                
                Spacer()
                Text(currentClass.className)
                    .font(.title)
                Spacer()
                Text("Teacher(s): \(currentClass.Teacher)")
                    
                Spacer()
                Slider(value: $sliderValue, in: 0...100)
                    .padding()
            
                HStack{
                    Text("Average Grade: \(tipText)%")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                }
                               
                Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
                    .padding()
                HStack{
                    Text("Average Homework Per Night (hr) ")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                }
               
                
               // Text(currentClass.averageGrade)
                
               
                
                
                
                
            }
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar{
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button(action: {
                        }) {
                            NavigationLink(destination: GuestView()) {
                                Image(systemName: "chevron.backward")
                            }
                        }
                    }
                        ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                        }) {
                            NavigationLink(destination: ContentView()) {
                                Image(systemName: "house.circle")
                            }
                        }
                    }
                        
                        
                    
                    
                }
            
            
            
            
        .navigationTitle(Text(currentClass.className))
        .navigationBarHidden(true)
        }.navigationBarBackButtonHidden(true)
           
   
        
    }
}
struct IndividualClassView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualClassView(currentClass: GlobalVar.CalcClass, sliderValue: 0.0)
    }
}
