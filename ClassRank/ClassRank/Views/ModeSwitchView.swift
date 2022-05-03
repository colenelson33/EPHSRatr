//
//  ModeSwitchView.swift
//  ClassRank
//
//  Created by 90304588 on 4/1/22.
//

import SwiftUI
import StoreKit

//Fetch products
//Purchase product
//Update UI / Product state

class ViewModel: ObservableObject{
    
    @Published var products: [Product] = []
    @Published var purchasedIDs: [String] = []
    
    func fetchProducts(){
        async{
            do{
                let products = try await Product.products(for: ["ephs2022.classrater.colorPurchase1"])
                
                
                DispatchQueue.main.async{
                    print(products)
                    self.products = products
                    
                }
                if let product = products.first{
                    await isPurchased(product: product)
                }
                
            }
            catch{
                print(error)
            }
        }
        
        
    }
    
    func isPurchased(product: Product) async {
      
            
                guard let state = await product.currentEntitlement else{return}
                
                switch state {
                case.verified(let transaction):
                //    print(transaction.productID)
                    DispatchQueue.main.async {
                        self.purchasedIDs.append(transaction.productID)
                    }
                    
                case.unverified(_):
                    break
                }
            
        
            
        
        
    }
    
    func purchase(){
        async{
            
            guard let product = products.first else { return }
            do{
                let result = try await product.purchase()
                switch result {
                    
                    
                    
                    
                case .success(let verification):
                    switch verification{
                    case.verified(let transaction):
                        print(transaction.productID)
                        DispatchQueue.main.async {
                            self.purchasedIDs.append(transaction.productID)
                        }
                        
                    case.unverified(_):
                        break
                        
                    }
                case .userCancelled:
                    break
                case .pending:
                    break
                @unknown default:
                    break
                }
                }
            catch{
                print(error)
                
            }
            
        }
    }
    
}


struct ModeSwitchView: View {
    
    @StateObject var viewModel = ViewModel()
    
    
    @EnvironmentObject var bigData: CloudDataViewModel
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("colorPallette") private var color = 0
    
    public static let ColorPurchase = "ephs2022.classrater.colorPurchase"
    
    
    
    var body: some View {
        NavigationView{
            
            
        VStack{
            Spacer()
            HStack{
                
                Text("Display Mode")
                    .font(.system(size: 30))
                    .padding()
                if !isDarkMode{
                    Image(systemName: "cloud.sun")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .padding()
                        .onTapGesture {
                            withAnimation{
                            isDarkMode.toggle()
                            }
                        }
                    
                }else{
                Image(systemName: "moon.stars")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .padding()
                        .foregroundColor(Color.navy)
                        .onTapGesture {
                            withAnimation{
                            isDarkMode.toggle()
                            }
                        }
                    
                }
                
                
            }
            
           Spacer()
            
            //[Color.iCloudBlue, Color.red, Color.pinkColor, Color.varunPurple, Color.forestGreen, Color.OrangeColor]
            
            VStack{
                HStack{
            Text("Color Options")
                .font(.system(size: 30))
                .padding()
                Image(systemName: "paintpalette")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .padding()
                    .foregroundColor(GlobalVar.colorList[color])
                    .onTapGesture{
                       
                       
                            
                            let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
                            var count = 0
                            for eachDepartment in
                                    GlobalVar.DepartmentList{
                                
                                for eachClass in eachDepartment{
                                    
                                    bigData.addClass(name: eachClass.className, prerequisites: eachClass.prerequisite, description: eachClass.description, department: departmentList[count])
                                    print("class added")
                                }
                                count+=1
                            }
                            
                            
                            
                       
                        
                        
                        
                        
                        
                    }

                }
            Picker("Scheme", selection: $color){
                HStack{
                    Text("Eagle Red")
                        
                        
                    
                }.tag(0)
                
                HStack{
                    Text("Icy Blue")
                        
                        .padding(53.5)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.tag(1)
                HStack{
                    Text("Pretty in Pink")
                        
                        .padding(30)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.tag(2)
                HStack{
                    Text("Purple Explosion")
                        
                        .padding(15)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.tag(3)
                HStack{
                    Text("Forest Green")
                        
                        .padding(33)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.tag(4)
                HStack{
                    Text("Rusty Orange")
                        
                        .padding(30)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.tag(5)
                
                
                
                
                
            }.pickerStyle(.inline)
                    .disabled(viewModel.purchasedIDs.isEmpty)
                    .padding()
                
            }
            Spacer()
            
            
            
          //  if let product = viewModel.products.first{
            Text(viewModel.purchasedIDs.isEmpty ? "Purchase Premium Colors" : "Purchased")
                    .font(.headline)
                Button(action: {
                    
                    if viewModel.purchasedIDs.isEmpty{
                    viewModel.purchase()
                    }
                    
                }) {
                    Text("$0.99")
                        .font(.headline)
                        .frame(width: 100, height: 30)
                        .background(GlobalVar.colorList[color])
                        .cornerRadius(20)
                        .foregroundColor(.white)
                }
        //    }
            
            
            Spacer()
            
            
        }.onAppear{
            viewModel.fetchProducts()
        
        }
        .navigationBarHidden(true)
        }
        
        .navigationBarBackButtonHidden(false)
        
     /*   .toolbar{
            
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button(action: {
                }) {
                    NavigationLink(destination: OtherGuestView()) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(GlobalVar.colorList[color])
                    }
                }
            }
            
        }*/
    }
}

struct ModeSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        ModeSwitchView()
    }
}
