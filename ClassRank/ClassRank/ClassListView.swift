//
//  ClassListView.swift
//  ClassRank
//
//  Created by 90304588 on 3/30/22.
//

import Foundation
import SwiftUI

struct MathClass: View{
    
    var currentClass: ClassData
    
    var body: some View{
        
        NavigationView{
            
            
            List(GlobalVar.MathClasses){ c in
                NavigationLink(destination: IndividualClassView(currentClass: c), label: {
                    VStack{
                        //   Text(currentClass.averageGrade)
                        Text(c.className)
                            .fontWeight(.semibold)
                        
                    }
                })
                
                //Text(currentClass.)
            }
            .listStyle(.inset)
            .navigationTitle(Text("Class List"))
            .navigationBarHidden(false)
        }
          .navigationBarBackButtonHidden(true)
        //.navigationBarHidden(true)
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
        
        
    }
    
}


