//
//  OtherGuestView.swift
//  ClassRank
//
//  Created by 90304588 on 4/8/22.
//

import SwiftUI
import UIKit

struct BlurryBackGroundView: View {
    
    @AppStorage("isDepartmentView") var isDepartmentView: Bool = true
    @AppStorage("isGuest") var isGuest: Bool = false
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @State var small = true
    @Namespace var namespace
    @State private var position: CardPosition = .small
    
    var body: some View {
        
        NavigationView{
            
            
            
            ScrollView {
                
                VStack {
                    ForEach(data, id: \.self) { p in
                        
                        
                        CardDetector(p:p, position: self.position)
                        
                    }
                    
                }
            }
            .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Image(systemName: "house.circle")
                            .foregroundColor(.red)
                            .onTapGesture{
                                isDepartmentView = false
                                isLoggedIn = false
                                isGuest = false
                            }
                    }
                }
                .navigationTitle("Departments")
        }
    }
}
extension Color {
    static let textColor = Color(red: 235 / 255, green: 235 / 255, blue: 235 / 255)
    static let subtextColor = Color(red: 199 / 255, green: 199 / 255, blue: 199 / 255)
}

struct blurTags: View {
    var tags: Array<String>
    let namespace: Namespace.ID
    var body: some View{
        HStack{
            ForEach(tags, id: \.self){ tag in
                Text("\(tag)")
                    .fontWeight(.semibold)
                    .foregroundColor(.subtextColor)
                    .font(.caption)
                
                
            }
        }.matchedGeometryEffect(id: "tags" , in: namespace)
    }
    
}

struct smallcardView: View {
    
    @AppStorage("isDepartmentView") var isDepartmentView = false
    @AppStorage("departmentIndex") var departmentIndex: Int = 0
    var p: ListData
    let namespace: Namespace.ID
    
    var body: some View {
        GeometryReader { g in
            VStack(alignment: .leading) {
                HStack {
                    Image(p.Image)
                        .resizable()
                        .frame(width: 120, height: 90)
                        .cornerRadius(10)
                        .matchedGeometryEffect(id: "image", in: namespace)
                    
                    VStack(alignment: .leading) {
                        Text("Classes Available: \(p.classesNum)")
                            .foregroundColor(Color.textColor)
                            .matchedGeometryEffect(id: "classNum", in: namespace)
                        Spacer()
                        Text(p.title)
                            .foregroundColor(Color.textColor)
                            .matchedGeometryEffect(id: "title", in: namespace)
                            .font(.title3)
                            
                        Spacer()
                    }.padding(.leading)
                 //   Spacer()
                   /* VStack {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color.white)
                            .matchedGeometryEffect(id: "ellipsis", in: namespace)
                        Spacer()
                    }*/
                }
            }
        }
    }
}

enum CardPosition: CaseIterable {
    case small, big
}



struct CardDetector: View {
    
    @AppStorage("isDepartmentView") var isDepartmentView = false
    @AppStorage("departmentIndex") var departmentIndex: Int = 0
    var p: ListData
    @State var position: CardPosition
    @Namespace var namespace
    var body: some View {
        
            Group {
                switch position {
                case .small:
                smallcardView(p: p, namespace: namespace)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(.red)
                    .cornerRadius(10)
                    .padding(.vertical,6)
                    .onTapGesture{
                        withAnimation{
                            isDepartmentView = false
                            departmentIndex = p.departmentIndex
                        }
                    }
                    .onLongPressGesture {
                        withAnimation {
                            position = .big
                            print("switch")
                        }
                    }
                    
                    .padding(.horizontal)
                case .big:
                bigcardView(p: p, namespace: namespace)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 270)
                    .background(.red)
                    .cornerRadius(10)
                    .padding(.vertical,6)
                    .onTapGesture{
                        withAnimation{
                            isDepartmentView = false
                            departmentIndex = p.departmentIndex
                        }
                    }
                    .onLongPressGesture {
                        withAnimation {
                            position = .small
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
}

struct bigcardView: View {
    var p: ListData
    let namespace: Namespace.ID
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                
                Spacer()
               /* HStack{
                    Text("Teachers: ")
                        .foregroundColor(.white)
                ForEach(p.teacherList, id: \.self){ teacher in
                        Text("\(teacher), ")
                        .foregroundColor(.white)
                        }
                }*/
                    
                
                
               Image(p.Image)
                    .resizable()
                    .frame(height: 160)
                    .frame(maxHeight: .infinity)
                    .cornerRadius(10)
                    .matchedGeometryEffect(id: "image", in: namespace)
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text("Classes Available: \(p.classesNum)")
                            .foregroundColor(Color.textColor)
                            .matchedGeometryEffect(id: "classNum", in: namespace)
                    }
                    
                    Spacer()
                    Text(p.title)
                        .foregroundColor(Color.textColor)
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .font(.largeTitle)
                    Spacer()
                }
                Spacer()

            }
        }
    }
}

struct BlurView: UIViewRepresentable{
    let style: UIBlurEffect.Style
    func makeUIView(context: UIViewRepresentableContext<BlurView>) ->  UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
        }
    }

struct OtherGuestView_Previews: PreviewProvider {
    static var previews: some View {
        BlurryBackGroundView()
    }
}
