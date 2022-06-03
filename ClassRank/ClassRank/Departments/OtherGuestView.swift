//
//  OtherGuestView.swift
//  ClassRank
//
//  Created by 90304588 on 4/8/22.
//

import SwiftUI
import UIKit

struct SearchView: View{
    var body: some View{
        Text("hello")
        
        
    }
    
    
}

struct MainDepartmentView: View {
    
    @State private var searchText = ""
    
    @AppStorage("isAdmin") var isAdmin = false
    
    @StateObject private var ck = CloudKitClassRank()
    @EnvironmentObject var bigData: CloudDataViewModel
    @AppStorage("isDarkMode") public var isDarkMode = false
    @AppStorage("ViewMode") var viewMode = 0
    @AppStorage("guestViewMode") var guestViewMode = 0
    @AppStorage("departmentIndex") var departmentIndex: Int = 0
    @AppStorage("individualView") var toggle: Bool = false
    @AppStorage("iCloudLoggedIn") var iCloudLoggedIn: Bool = false
    @AppStorage("colorPallette") private var color = 0
    @AppStorage("userId") var userId : String = ""
    @State var small = true
    @Namespace var namespace
    @State private var position: CardPosition = .small
    @State var indexSelection: Int = 0
    @EnvironmentObject var index: GlobalVariables
    @AppStorage("tutorial") private var tutorial = true
    
    
    
    @StateObject private var dataRank = CloudKitClassRank()
    @State var isAnimating = false
    @AppStorage("isGradient") var isGradient = false
    
    func nameList(classList: [gradeModel]) -> [String]{
        var list: [String] = []
        for eachClass in classList{
            list.append(eachClass.name)
            
        }
        
        return list
    }
    
    var searchResults: [String] {
        let names = nameList(classList: bigData.classList)
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
    
    var body: some View {
        
        
        NavigationView{
            
            
            
            ZStack{
                //      let gradient2 = Gradient(colors: [ isDarkMode ? .black : .white, GlobalVar.colorList[color]])
                //      isGradient ? LinearGradient(gradient: gradient2, startPoint: isAnimating ? .topLeading : .bottomTrailing, endPoint: .bottomTrailing)
                //       .ignoresSafeArea()
                //     .animation(.linear(duration: 5).repeatForever(autoreverses: true), value: isAnimating) : nil
                
                if searchText != ""{
                    List{
                        ForEach(searchResults, id: \.self) { name in
                            
                            Text(name)
                                .onTapGesture {
                                    
                                    
                                    bigData.className = name
                                    
                                    DispatchQueue.main.async {
                                        
                                        bigData.fetchItems()
                                    }
                                    
                                    viewMode = 1
                                    guestViewMode = 2
                                    departmentIndex = 1
                                    toggle = true
                                    
                                }
                            
                        }
                        
                    }.zIndex(100)
                }
                
                ScrollView {
                    
                    /*   if ck.userName != ""{
                     Text("Welcome back, \(ck.userName)")
                     }else{
                     Text("Welcome")
                     }
                     if ck.permissionStatus == false{
                     Text("Accept permissions")
                     }
                     
                     
                     */
                    
                    
                    
                    
                    
                    
                    VStack {
                        HStack{
                        
                          /*  if dataRank.userName != ""{
                            Text("Welcome back, \(dataRank.userName)")
                                .font(.title)
                                .foregroundColor(GlobalVar.colorList[color])
                            }else{
                            Text("Welcome")
                                    .font(.title)
                                    .foregroundColor(GlobalVar.colorList[color])
                                
                            }*/
                            
                          //  Spacer()
                                    Button(action: {
                                       
                                    }){
                                        
                                        if dataRank.userName != ""{
                                        NavigationLink {
                                            MainScheduleView()
                                        } label: {
                                            Text("View \(dataRank.userName)'s Schedule")
                                                    .padding()
                                        }
                                        }else{
                                            NavigationLink {
                                                MainScheduleView()
                                            } label: {
                                                Text("View Schedule")
                                                        .padding()
                                            }
                                            
                                            
                                        }
                                    }
                                    .buttonStyle(GrowingNewButton())
                                    .padding()
                                

                            
                                
                            
                            
                        }
                        ForEach(data, id: \.self) { p in
                            
                            CardDetector(p:p, position: self.position)
                            
                        }
                        
                    }
                }
                
            }.onAppear{
                
                if !tutorial{
                    index.isPresented = false
                } else {
                    index.isPresented = true
                }
            }
            .sheet(isPresented: $index.isPresented, content: {
                VStack{
                    TabView(selection: $index.indexClicked){
                        FirstPage().tag(0)
                        SecondPage().tag(1)
                        ThirdPage().tag(2)
                        FourthPage().tag(3)
                        FifthPage().tag(4)
                        SixthPage().tag(5)
                        SeventhPage().tag(6)
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    
                    
                    
                }
                .onChange(of: index.indexClicked){ x in
                    print("Changed \(x)")
                }.zIndex(100)
            })
            .toolbar{
                
                
                    
                
                ToolbarItem(placement: .navigationBarLeading){
                    Image(systemName: "house.circle")
                        .foregroundColor(GlobalVar.colorList[color])
                        .onTapGesture{
                            
                            if userId != ""{
                            showAlert = true
                            }else{
                                userId = ""
                                guestViewMode = 0
                                
                                
                            }
                            
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                        title: Text("Log Out"),
                                        message: Text("Are you sure you want to sign out?"),
                                        primaryButton: .default(
                                            Text("Cancel"),
                                            action: {showAlert = false
                                            }
                                        ),
                                        secondaryButton: .destructive(
                                            Text("Log Out"),
                                            action: {
                                                
                                            userId = ""
                                            guestViewMode = 0
                                            }
                                        )
                                    )
                        }
                }
                
            
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ModeSwitchView(password: "", className: "", department: "", description: "", preR: "")) {
                        Image(systemName: "gear")
                            .foregroundColor(GlobalVar.colorList[color])
                    }
                    
                }
                /*    ToolbarItem(placement: .bottomBar){
                 
                 
                 
                 
                 if isAdmin == false{
                 NavigationLink(destination: LoginView(username: "")) {
                 Image(systemName: "plus")
                 .foregroundColor(GlobalVar.colorList[color])
                 
                 
                 }
                 }else{
                 
                 NavigationLink(destination: AdminView(className: "", department: "", description: "", preR: "")) {
                 Image(systemName: "plus")
                 .foregroundColor(GlobalVar.colorList[color])
                 
                 
                 }
                 
                 
                 }
                 }*/
            }
            .navigationTitle("Departments")
            .searchable(text: $searchText, prompt: "Look up a class")
            
            
            
            
        }
        .refreshable{
            bigData.initFunc()
            bigData.fetchItems()
            
            
        }
    }
    
    @State private var showAlert = false
}

extension Color {
    static let textColor = Color(red: 235 / 255, green: 235 / 255, blue: 235 / 255)
    static let subtextColor = Color(red: 199 / 255, green: 199 / 255, blue: 199 / 255)
}

struct blurTags: View {
    @AppStorage("colorPallette") private var color = 0
    var tags: Array<String>
    let namespace: Namespace.ID
    var body: some View{
        HStack{
            ForEach(tags, id: \.self){ tag in
                Text("\(tag)")
                    .fontWeight(.semibold)
                    .foregroundColor(GlobalVar.colorList[color])
                    .font(.caption)
                
                
            }
        }.matchedGeometryEffect(id: "tags" , in: namespace)
    }
    
}

struct smallcardView: View {
    @AppStorage("colorPallette") private var color = 0
    @EnvironmentObject var bigData: CloudDataViewModel
    @AppStorage("isDepartmentView") var isDepartmentView = false
    @AppStorage("departmentIndex") var departmentIndex: Int = 0
    @State private var animationAmount = 1.0
    var p: ListData
    let namespace: Namespace.ID
    
    var body: some View {
        
        let departments = [bigData.ArtClasses, bigData.BusinessClasses, bigData.EnglishClasses, bigData.FacsClasses, bigData.TechEdClasses, bigData.MathClasses, bigData.MusicClasses, bigData.PhyEdClasses, bigData.ScienceClasses, bigData.SSClasses, bigData.WorkClasses, bigData.LanguageClasses ]
        
        
        GeometryReader { g in
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: p.symbol)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                    
                        .foregroundColor(GlobalVar.colorList[color])
                    //.cornerRadius(10)
                        .matchedGeometryEffect(id: "image", in: namespace)
                        .padding()
                    VStack(alignment: .leading) {
                        Text("Classes Available: \(departments[p.departmentIndex].count)")
                            .foregroundColor(GlobalVar.colorList[color])
                            .matchedGeometryEffect(id: "classNum", in: namespace)
                        Spacer()
                        Text(p.title)
                            .foregroundColor(GlobalVar.colorList[color])
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


func colorFunc() -> Color{
    
    @AppStorage("isDarkMode") var isDarkMode = false
    if isDarkMode{
        let bColor = Color.darkGray
        return bColor
    }else{
        let bColor = Color.offWhite
        return bColor
    }
    
    
}


struct CardDetector: View {
    
    @AppStorage("colorPallette") private var color = 0
    @AppStorage("departmentIndex") var departmentIndex: Int = 0
    @AppStorage("ViewMode") var viewMode = 0
    @AppStorage("guestViewMode") var guestViewMode = 0
    @AppStorage("isDarkMode") public var isDarkMode = false
    var p: ListData
    @State var position: CardPosition
    @Namespace var namespace
    let bColor = colorFunc()
    var body: some View {
        
        
        Group {
            switch position {
            case .small:
                smallcardView(p: p, namespace: namespace)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(bColor)
                    .cornerRadius(10)
                    .padding(.vertical,6)
                    .onTapGesture{
                        withAnimation{
                            departmentIndex = p.departmentIndex
                            viewMode = 1
                            guestViewMode = 2
                            
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
                    .background(bColor)
                    .cornerRadius(10)
                    .padding(.vertical,6)
                    .onTapGesture{
                        withAnimation{
                            viewMode = 1
                            guestViewMode = 2
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
struct miniCardView: View{
    
    @AppStorage("colorPallette") private var color = 0
    let namespace: Namespace.ID
    @State private var animationAmount = 1.0
    var body: some View{
        
        GeometryReader { g in
            VStack(alignment: .leading){
                HStack{
                    
                    Text("Access your current schedule")
                        .foregroundColor(GlobalVar.colorList[color])
                    //.cornerRadius(10)
                        .matchedGeometryEffect(id: "schedule", in: namespace)
                }
                
            }
            
            
        }
    }
    
}





struct bigcardView: View {
    @AppStorage("colorPallette") private var color = 0
    @EnvironmentObject var bigData: CloudDataViewModel
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
                
                let departments = [bigData.ArtClasses, bigData.BusinessClasses, bigData.EnglishClasses, bigData.FacsClasses, bigData.TechEdClasses, bigData.MathClasses, bigData.MusicClasses, bigData.PhyEdClasses, bigData.ScienceClasses, bigData.SSClasses, bigData.WorkClasses, bigData.LanguageClasses ]
                
                Image(p.Image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 160)
                    .frame(maxHeight: .infinity)
                    .cornerRadius(10)
                    .matchedGeometryEffect(id: "image", in: namespace)
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text("Classes Available: \(departments[p.departmentIndex].count)")
                            .foregroundColor(GlobalVar.colorList[color])
                            .matchedGeometryEffect(id: "classNum", in: namespace)
                    }
                    
                    Spacer()
                    Text(p.title)
                        .foregroundColor(GlobalVar.colorList[color])
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
        MainDepartmentView()
    }
}


extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

