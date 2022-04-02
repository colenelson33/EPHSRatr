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
    
    var body: some View {
        NavigationView{
            VStack{
                Text(currentClass.averageGrade)
                Text(currentClass.className)
                
                
            }.navigationTitle(Text(currentClass.className))
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar{
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button(action: {
                        }) {
                            NavigationLink(destination: GuestView()) {
                                Image(systemName: "arrowshape.turn.up.backward.circle.fill")
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
            
            
            
            
        .navigationBarHidden(true)
        }.navigationBarBackButtonHidden(true)
   
        
    }
}
