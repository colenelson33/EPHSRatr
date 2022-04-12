//
//  TestData.swift
//  ClassRank
//
//  Created by Cole Nelson on 4/11/22.
//

import SwiftUI
import CloudKit

class TestDataViewModel: ObservableObject{
    
    @Published var text: String = ""
    @Published var grade: String = ""
    
    func saveButtonPressed(){
        guard !text.isEmpty else {
            return
        }
    //    addItem(name: text)
        averageGrade(val: grade)
    }
    private func averageGrade(val: String){
        let avgGrade = CKRecord(recordType: "MathGrade")
        avgGrade["grade"] = val
        saveItem(record: Double: avgGrade)
    }
    
    private func addItem(name: String){
        let newFruit = CKRecord(recordType: "fruits")
        newFruit["name"] = name
        saveItem(record: newFruit)
        
    }
    
    private func saveItem(record: CKRecord){
        CKContainer.default().publicCloudDatabase.save(record) { [weak self] returnedRecord, returnedError in
            print(returnedRecord)
            print("Error: \(returnedError)")
            
            self?.text = ""
        }
    }
    
    
}

struct TestData: View {
    
    @State private var vm = TestDataViewModel()
    var body: some View {
    
        NavigationView{
            VStack{
                header
                textField
                button
                List{
                    Text("Hi")
                    Text("Hello")
                }
               .listStyle(.plain)
            }
            .padding()
            .navigationBarHidden(true)
        }
     
    }
}

struct TestData_Previews: PreviewProvider {
    static var previews: some View {
        TestData()
    }
}

extension TestData{
    
    private var header: some View{
        Text("CloudKit Crud 😏")
            .font(.headline)
    }
    private var textField: some View{
        TextField("Add Something", text: $vm.grade)
            .padding(.leading)
            .frame(height: 55)
            .background(.gray)
            .cornerRadius(10)
            .opacity(0.4)
            .padding()
    }
    
    private var button: some View{
        Button{
            vm.saveButtonPressed()
        } label: {
            Text("Add")
                .frame(height: 55)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background(.pink)
                .cornerRadius(10)
                .padding()
        }
        
    }
    
}
