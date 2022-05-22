//
//  Neomorphism.swift
//  ClassRank
//
//  Created by 90304588 on 5/18/22.
//

import SwiftUI

struct ScheduleView: View{
    
     var body: some View{
        
    
        ZStack {
        //Ellipse 13
            Ellipse()
            .fill(Color(#colorLiteral(red: 0.9954999685287476, green: 0.7749999761581421, blue: 1, alpha: 1)))
            .frame(width: 300, height: 300)
            .offset(x: 30, y: 200)
            .blur(radius: 40)
            .zIndex(2)
            
            Ellipse()
            .fill(Color(#colorLiteral(red: 0.9954999685287476, green: 0.7749999761581421, blue: 1, alpha: 1)))
            .frame(width: 150, height: 150)
            .offset(x: -20, y: -100)
            .blur(radius: 40)
            .zIndex(2)

        //Rectangle 4
            Rectangle()
            .fill(LinearGradient(
            gradient: Gradient(stops: [
            .init(color: Color(#colorLiteral(red: 0.9966666698, green: 0.8333333135, blue: 1, alpha: 1)), location: 0),
            .init(color: Color(#colorLiteral(red: 0.7291666269302368, green: 0.7399999499320984, blue: 1, alpha: 0.9399999976158142)), location: 1)]),
            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
            .frame(width: 300, height: 600)
            .zIndex(1)
            VStack{
        //Edit
             /*   Ellipse()
                .fill(Color(#colorLiteral(red: 0.9954999685287476, green: 0.7749999761581421, blue: 1, alpha: 1)))
                .frame(width: 200, height: 200)
                .blur(radius: 40)
                .zIndex(100)

            //Ellipse 12
                Ellipse()
                .fill(Color(#colorLiteral(red: 0.9954999685287476, green: 0.7749999761581421, blue: 1, alpha: 1)))
                .frame(width: 300, height: 300)
                .blur(radius: 40)
                .zIndex(100)*/
                HStack{
                Text("Schedule").font(.custom("Inter Regular", size: 40)).foregroundColor(Color(#colorLiteral(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)))
                        .padding()
                    Spacer()
                Text("9th").font(.custom("Inter Regular", size: 25)).foregroundColor(Color(#colorLiteral(red: 0.24, green: 0.12, blue: 1, alpha: 1)))
                        .padding()
                }
                .zIndex(200)
                HStack{
                Text("Class Name").font(.custom("Inter Regular", size: 25)).foregroundColor(Color(#colorLiteral(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)))
                        .padding()
                    Spacer()
                }
                
               
                
        //Ceramics Mathematics
                HStack{
                VStack(alignment: .leading){
            Text("Ceramics\n\nMathematics").font(.custom("Inter Regular", size: 20)).foregroundColor(Color(#colorLiteral(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)))
                        .padding()
                        .zIndex(200)
                    
                }
                    Spacer()
                }

                Spacer()
                HStack{
                    Spacer()
                Text("Edit").font(.custom("Inter Regular", size: 20)).foregroundColor(Color(#colorLiteral(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)))
                        .padding()
                }
            }
            .zIndex(3)
        }
        .cornerRadius(25)
        .frame(width: 300, height: 600)
    }
    }
    


struct ClassPopUp: View{
    
    @EnvironmentObject var bigData: CloudDataViewModel
    @AppStorage("freshmanClasses") var freshman: [String] = []
    @AppStorage("sophomoreClasses") var sophomore: [String] = []
    @AppStorage("juniorClasses") var junior: [String] = []
    @AppStorage("seniorClasses") var senior: [String] = []
    @Binding var open: Bool
    var body: some View{
        ZStack {
        //11th
            VStack{
                
                HStack{
                    Spacer()
                    Image(systemName: "x.circle")
                        .onTapGesture {
                            self.open.toggle()
                        }
                        .foregroundColor(.white)
                        .padding(.trailing, 30)
                        .ignoresSafeArea(.all)
                }
                
                Text("Which grade do you want this course to be added to?").font(.custom("Inter Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .padding([.bottom, .trailing, .leading], 25)
                
            
            HStack{
                
                Spacer()
                Button(action: {
                    freshman.append(bigData.grades.name)
                    self.open.toggle()
                    
                }){
            Text("9th").font(.custom("Inter Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                }
                Spacer()
        //10th
                Button(action:{
                    sophomore.append(bigData.grades.name)
                    self.open.toggle()
                }){
            Text("10th").font(.custom("Inter Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                }
                Spacer()
        //12th
                Button( action: {
                    junior.append(bigData.grades.name)
                    self.open.toggle()
                }){
            Text("11th").font(.custom("Inter Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                }
                Spacer()
        //9th
                Button(action: {
                    senior.append(bigData.grades.name)
                    self.open.toggle()
                }){
            Text("12th").font(.custom("Inter Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                }
                Spacer()
                    
        //Which grade do you want th...
            }
            }.zIndex(100)
        //Rectangle 1
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(#colorLiteral(red: 0.47083333134651184, green: 0.47083333134651184, blue: 0.47083333134651184, alpha: 0.9)))
            
            .frame(width: 422, height: 234)
        }
        
        .offset(y: open ? 0 : UIScreen.main.bounds.height)
        .animation(.default)
        
        
    }
    
}

struct Neomorphism: View {
    
    @Binding var open: Bool
    
    var body: some View {
        //Rectangle 1
        ZStack{
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0.778166651725769, green: 0.4958333373069763, blue: 1, alpha: 1)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0.6418750286102295, green: 0.9150375723838806, blue: 0.9750000238418579, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                        endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
                
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color(#colorLiteral(red: 0.8208333253860474, green: 0.8208333253860474, blue: 0.8208333253860474, alpha: 1)), lineWidth: 1)
            }
            .frame(width: 422, height: 234)
            VStack{
                //Click the grade you would ...
                Text("Click the grade you would like this course to be selected for").font(.custom("Inter Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                HStack{
                    //Ellipse 4
                    ZStack{
                        Circle()
                            .fill(LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 0.9583333134651184, green: 0.7067708373069763, blue: 0.7067708373069763, alpha: 1)), location: 0),
                                    .init(color: Color(#colorLiteral(red: 0.9583333134651184, green: 0.7067708373069763, blue: 0.7067708373069763, alpha: 0)), location: 1)]),
                                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
                            .frame(width: 55, height: 55)
                        Text("9th").font(.custom("Inter Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    }
                    
                    //Ellipse 3
                    ZStack{
                        Circle()
                            .fill(LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 0.9583333134651184, green: 0.7067708373069763, blue: 0.7067708373069763, alpha: 1)), location: 0),
                                    .init(color: Color(#colorLiteral(red: 0.9958333373069763, green: 0.7842187285423279, blue: 0.7842187285423279, alpha: 0)), location: 1)]),
                                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
                            .frame(width: 55, height: 55)
                        Text("10th").font(.custom("Inter Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    }
                    
                    //Ellipse 2
                    ZStack{
                        Circle()
                            .fill(LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 0.9583333134651184, green: 0.7067708373069763, blue: 0.7067708373069763, alpha: 1)), location: 0),
                                    .init(color: Color(#colorLiteral(red: 0.8509804010391235, green: 0.8509804010391235, blue: 0.8509804010391235, alpha: 0)), location: 1)]),
                                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
                            .frame(width: 55, height: 55)
                        Text("11th").font(.custom("Inter Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    }
                    //Ellipse 1
                    ZStack{
                        Circle()
                            .fill(LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 0.9583333134651184, green: 0.7067708373069763, blue: 0.7067708373069763, alpha: 1)), location: 0),
                                    .init(color: Color(#colorLiteral(red: 0.8509804010391235, green: 0.8509804010391235, blue: 0.8509804010391235, alpha: 0)), location: 1)]),
                                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
                            .frame(width: 55, height: 55)
                        Text("12th").font(.custom("Inter Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    }
                    
                    
                }
                
            }
        }.offset(y: open ? 0 : UIScreen.main.bounds.height)
            .animation(.default)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ClassPopUp(open: .constant(true))
    }
}

struct GradeDetect: View{
    
    @AppStorage("colorPallette") private var color = 0
 //   @State var grade: Int
    @State var position: CardPosition
    @Namespace var namespace
    var body: some View{
        Group {
            switch position {
            case .small:
                IndividualGrade(namespace: namespace)
                    
                    .padding()
                    .frame(width: 70, height: 40)
                    .background(GlobalVar.colorList[color])
                    .cornerRadius(10)
              //      .padding(.vertical,6)
                    .onTapGesture{
                        withAnimation{
                        position = .big
                            
                        }
                    }
                    
                
                    .padding(.horizontal)
            case .big:
                GradeSelection(namespace: namespace)
                    .padding()
                    .frame(width: 70, height: 120)
                    .background(GlobalVar.colorList[color])
                    .cornerRadius(10)
                    
                    
                    .onTapGesture{
                        withAnimation{
                        position = .small
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
            }
        }
        
        
    }
    
    
}

struct IndividualGrade: View{
    
    
    //@State var grade: Int
    @AppStorage("currentGradeLevel") var gradeLevelCurrent: Int = 0
    let namespace: Namespace.ID
    var body: some View{
        GeometryReader{ g in
            VStack{
                Text("\(gradeLevelCurrent + 9)th")
                    .matchedGeometryEffect(id: "\(gradeLevelCurrent)th", in: namespace)
                
            }
            .edgesIgnoringSafeArea(.all)
            
            
            
        }
        
    }
    
    
    
    
}

struct GradeSelection: View{
    
  //  @State var grade: Int
    @AppStorage("currentGradeLevel") var gradeLevelCurrent: Int = 0
    let namespace: Namespace.ID
    var body: some View{
        GeometryReader{ g in
            VStack{
                
                Text("9th")
                    .matchedGeometryEffect(id: "9th", in: namespace)
                    .foregroundColor(.white)
                    .onTapGesture {
                        gradeLevelCurrent = 0
                    }
                
                Text("10th")
                    .matchedGeometryEffect(id: "10th", in: namespace)
                    .foregroundColor(.white)
                    .onTapGesture {
                        gradeLevelCurrent = 1
                    }
                Text("11th")
                    .matchedGeometryEffect(id: "11th", in: namespace)
                    .foregroundColor(.white)
                    .onTapGesture {
                        gradeLevelCurrent = 2
                    }
                
                Text("12th")
                    .matchedGeometryEffect(id: "12th", in: namespace)
                    .foregroundColor(.white)
                    .onTapGesture {
                        gradeLevelCurrent = 3
                    }
            }
            .edgesIgnoringSafeArea(.all)
            
            
        }
        
        
        
    }
    
    
}
