//
//  TestData.swift
//  ClassRank
//
//  Created by Cole Nelson on 4/11/22.
//

import SwiftUI
import CloudKit

struct gradeModel: Hashable{
    
    let name: String
    let record: CKRecord
    var gradeList: [Double]
    var homeworkList: [Double]
    
    
}

class CloudDataViewModel: ObservableObject{
    
    @Published var text: String = ""
    @Published var grades: [gradeModel] = []
    
    init(){
        fetchItems()
    }

    
    
    func saveButtonPressed(){
       guard !text.isEmpty else {
            return
       }
        if checkForDouble(grade: text) == 0.0{
            
        }
    }
   
    func fetchItems(){
        
        @AppStorage("className") var className: String = ""
        
        let predicate = NSPredicate(format: "name = %@", argumentArray: [className])
      //  let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Class", predicate: predicate)
        //query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.resultsLimit = 1
        
        var returnedItems: [gradeModel] = []
        
        
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult{
            case .success(let record):
                guard let name = record["name"] as? String else{ return }
                guard let gradeList = record["gradeList"] as? [Double] else { return }
                guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList))
                
            case .failure(let error):
                print("Record matched error: \(error)")
            }
            
        }
        
        queryOperation.queryResultBlock = { [weak self]returnedResult in
            print(returnedResult)
            DispatchQueue.main.async {
                self?.grades = returnedItems
            }
            
        }
        
        addOperations(operation: queryOperation)
       }
    
    /*func fetchItems2(){
        
        
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
       }*/
    
    func addOperations(operation: CKDatabaseOperation){
        CKContainer.default().publicCloudDatabase.add(operation)
    }
    
    func updateGrades(grade: gradeModel){
        let record = grade.record
        var newList = grade.gradeList
        newList.append(100)
        print("ok")
        record["gradeList"] = newList
        saveItem(record: record, className: grade.name)
        
    }
    
    func addItem(name: gradeModel){
        
        let newFruit = CKRecord(recordType: "Grade")
        newFruit["name"] = name.name
        newFruit["gradeList"] = name.gradeList
        newFruit["homeworkList"] = name.homeworkList
        saveItem(record: name.record, className: name.name)
        
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
     func saveItem(record: CKRecord, className: String){
        CKContainer.default().publicCloudDatabase.save(record) { [weak self] returnedRecord, returnedError in
            print(returnedRecord)
            print("Error: \(returnedError)")
            DispatchQueue.main.async {
                self?.text = ""
        //        self?.fetchItems(className: className)
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
    
    func averageGrade(gradeList: [Double]) -> String{
        var averageGrade: Double = 0.0
        var count = 0.0
        for grade in gradeList{
            
            averageGrade += grade
            count+=1
            }
        let y = Double(round(100*(averageGrade/count))/100)
        return String(y)
       
    }

}




struct CloudData: View {
    
    @State private var vm = CloudDataViewModel()

    
    var body: some View {
    
        

        NavigationView{
            VStack{
                header
                textField
                button
                List{
                    ForEach(vm.grades, id: \.self){ grade in
                        Text(grade.name)
                        Spacer()
                        Text(vm.averageGrade(gradeList: grade.gradeList))
                            .onTapGesture {
                                vm.updateGrades(grade: vm.grades[0])
                            }
                      }//.onDelete(perform: vm.deleteItem )
                        
                    
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
        CloudData()
    }
}

extension CloudData{
    
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
