//
//  TestData.swift
//  ClassRank
//
//  Created by Cole Nelson on 4/11/22.
//

import SwiftUI
import CloudKit

struct fruitModel: Hashable{
    let name: String
    let record: CKRecord
    
}

struct gradeModel: Hashable{
    
    let name: [Double]
    let record: CKRecord
    
    
}

class TestDataViewModel: ObservableObject{
    
    @Published var text: String = ""
    @Published var fruits: [fruitModel] = []
    //@Published var grades: [Double]
    @Published var gradeArray: gradeModel
//    @Published var grade: String = ""
    
    init(){
        fetchItems()
    }

    func saveButtonPressed(){
       /* guard !text.isEmpty else {
            return
        }*/
        if let grade = Double(text){
        addItem(name: grade)
        }
        
       // averageGrade(val: grade)
    }
   /* func fetchGrade(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Grade", predicate: predicate)
        let queryOperation = CKQueryOperation(query: query)
        
        var returnedGrades: [Double] = []
        
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult{
            case .success(let record):
                guard let name = record["name"] as? Double else{ return }
                returnedGrades.append(returnedResult)
                
            case .failure(let error):
                print("Record matched error: \(error)")
            }
            
        }
        
        
        
    }*/
    
    func fetchItems2(){
        
        
        //let predicate = NSPredicate(format: "name = %@", argumentArray: ["Cocoanut"])
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "fruits", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.resultsLimit = 5
        
        var returnedItems: [fruitModel] = []
        
        
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult{
            case .success(let record):
                guard let name = record["name"] as? String else{
                    return
                }
                returnedItems.append(fruitModel(name: name, record: record))
                
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
    
    func fetchItems(){
         
         
         let predicate = NSPredicate(value: true)
         let query = CKQuery(recordType: "Grade", predicate: predicate)
         let queryOperation = CKQueryOperation(query: query)
         queryOperation.resultsLimit = 1
         
         
         
         
         queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
             switch returnedResult{
             case .success(let record):
                 guard let name = record["gradeList"] as? [Double] else{
                    return
                 }
                 var returnedItem = gradeModel(name: name, record: record)

                 
                
                 
             case .failure(let error):
                 print("Record matched error: \(error)")
                 return
             }
             

         }
         
         queryOperation.queryResultBlock = { returnedResult in
             print(returnedResult)
             DispatchQueue.main.async {
               //  self?.fetchItems()
             }
             
         }
         
         addOperations(operation: queryOperation)
        
     }
    
    
    
    
    func addOperations(operation: CKDatabaseOperation){
        
       
        CKContainer.default().publicCloudDatabase.add(operation)
        
        
    }
    
    func updateItem(fruit: fruitModel){
        let record = fruit.record
        record["name"] = "Something else something else"
        saveItem(record: record)
        
    }
    
    func updateGradeList(grade: gradeModel, newGrades: [Double]){
        
        let record = grade.record
        record["gradeList"] = newGrades
        
    }
    
    
    
    private func addItem(name: Double){
        let newFruit = CKRecord(recordType: "Grade")
        newFruit["name"] = name
        saveItem(record: newFruit)
        
    }
    
   /* private func addIndividualGrade(grade: Double){
        CKContainer.default().publicCloudDatabase.save(grade){ [weak self]
            returnedGrade, returnedError in
            print(returnedGrade)
            print("Error: \(returnedError)")
            DispatchQueue.main.async {
                self?.text = ""
                self?.fetchGrade()
            }
            
        }
    }
    */
    private func saveItem(record: CKRecord){
        CKContainer.default().publicCloudDatabase.save(record) { [weak self] returnedRecord, returnedError in
            print(returnedRecord)
            print("Error: \(returnedError)")
            DispatchQueue.main.async {
                self?.text = ""
                self?.fetchItems()
            }
            
            
        }
    }
    /*func deleteItem(indexSet: IndexSet){
        guard let index = indexSet.first else{ return }
        let fruit = gradeArray[index]
        let record = fruit.record
        
        CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { [weak self] returnedRecordID, error in
            DispatchQueue.main.async {
                self?.gradeArray.remove(at: index)
                self?.fetchItems()
            }
            
        }
    }*/
    
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
                   // ForEach(vm.gradeArray.name, id: \.self){ grade in
                     //   Text(grade.name)
                            /*.onTapGesture {
                                vm.updateItem(fruit: fruit)
                            }*/
                   // }//.onDelete(perform: vm.deleteItem )
                        
                    
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
