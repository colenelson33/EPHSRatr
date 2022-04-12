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
    @Published var fruits: [String] = []
//    @Published var grade: String = ""
    
    init(){
        fetchItems()
    }
    
    func saveButtonPressed(){
        guard !text.isEmpty else {
            return
        }
        addItem(name: text)
        
       // averageGrade(val: grade)
    }
    
    func fetchItems(){
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "fruits", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let queryOperation = CKQueryOperation(query: query)
        
        var returnedItems: [String] = []
        
        
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult{
            case .success(let record):
                guard let name = record["name"] as? String else{
                    return
                }
                returnedItems.append(name)
                
            case .failure(let error):
                print("Record matched error: \(error)")
            }
            
        }
        
        queryOperation.queryResultBlock = { [weak self]returnedResult in
            print(returnedResult)
            DispatchQueue.main.async {
                self?.fruits = returnedItems
            }
            
        }
        
        addOperations(operation: queryOperation)
       
    }
    
    func addOperations(operation: CKDatabaseOperation){
        
       
        CKContainer.default().publicCloudDatabase.add(operation)
        
        
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
    
    private func checkForDouble(grade: String) -> Double{
        if let newGrade = Double(grade){
            return newGrade
        }else{
            return 0.0
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
                    ForEach(vm.fruits, id: \.self){
                        Text($0)
                    }
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
        TextField("Add Something", text: $vm.text)
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
