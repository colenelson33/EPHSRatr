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

struct newGradeModel: Hashable{
    let name: String
    var gradeList: [Double]
    var homeworkList: [Double]
    
}

class CloudDataViewModel: ObservableObject{
    
    @Published var grades: gradeModel = gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.0])
    @Published var className: String = ""
    @Published var classData = ClassData(className: "", Teacher: "", credits: 0, preR: "", description: "")

   
    func fetchItems(){
        
      //  @AppStorage("className") var className: String = ""
        
        let predicate = NSPredicate(format: "name = %@", argumentArray: [className])
      //  let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Class", predicate: predicate)
        //query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.resultsLimit = 1
        
        var returnedItems: gradeModel = gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.0])
        
        
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult{
            case .success(let record):
                guard let name = record["name"] as? String else{ return }
                guard let gradeList = record["gradeList"] as? [Double] else { return }
                guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                returnedItems = gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList)
                
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
    
    func addOperations(operation: CKDatabaseOperation){
        CKContainer.default().publicCloudDatabase.add(operation)
    }
    
    func updateGrades(grade: gradeModel, num: Double){
        if grade.gradeList == [0.0]{
            let record = grade.record
            print("ok")
            record["gradeList"] = [num]
            saveItem(record: record)
            
        }else{
        
        let record = grade.record
        var newList = grade.gradeList
        newList.append(num)
        record["gradeList"] = newList
        saveItem(record: record)
        }
        
    }
    
    func updateHomework(grade: gradeModel, num: Double){
        if grade.homeworkList == [0.0] || grade.homeworkList == [0.1]{
            let record = grade.record
            print("ok")
            record["homeworkList"] = [num]
            saveItem(record: record)
            
        }else{
        
        let record = grade.record
        var newList = grade.homeworkList
        newList.append(num)
        record["homeworkList"] = newList
        saveItem(record: record)
        }
        
    }
    
    
    func addItem(name: String, num: Double){
        
        let newClass = CKRecord(recordType: "Class")
        newClass["name"] = name
        newClass["gradeList"] = [num]
        newClass["homeworkList"] = [0.1]
        saveItem(record: newClass)
        
    }
    
    func addItemHW(name: String, num: Double){
        
        let newClass = CKRecord(recordType: "Class")
        newClass["name"] = name
        newClass["gradeList"] = [0.0]
        newClass["homeworkList"] = [num]
        saveItem(record: newClass)
        
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
     func saveItem(record: CKRecord){
        CKContainer.default().publicCloudDatabase.save(record) { [weak self] returnedRecord, returnedError in
            print(returnedRecord)
            print("Error: \(returnedError)")
            DispatchQueue.main.async {
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
    
    func averageGradeDouble(gradeList: [Double]) -> Double{
        var averageGrade: Double = 0.0
        var count = 0.0
        for grade in gradeList{
            
            averageGrade += grade
            count+=1
            }
        return Double(round(100*(averageGrade/count))/100)
        
    }

}




struct CloudData: View {
    
    @State private var vm = CloudDataViewModel()

    
    var body: some View {
    
        

        NavigationView{
            VStack{
                header
               
                button
                List{
                    
                    Text(vm.grades.name)
                        Spacer()
                    Text(vm.averageGrade(gradeList: vm.grades.gradeList))
                            
                      }//.onDelete(perform: vm.deleteItem )
                        
                    
                
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
   
    
    private var button: some View{
        Button{
         //   vm.saveButtonPressed()
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
