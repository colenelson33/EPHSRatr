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
    var prerequisites: String
    var description: String
    var department: String
//    var userId: String
    
    
}

struct newGradeModel: Hashable{
    let name: String
    var gradeList: [Double]
    var homeworkList: [Double]
    
}

extension GlobalVar{
    
    static var Departments: [[gradeModel]] = [[]]
    
}

class CloudDataViewModel: ObservableObject{
    
    @Published var classList: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var grades: gradeModel = gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")
                                                   

    @Published var className: String = ""
    //@Published var classData = ClassData(className: "", Teacher: "", credits: 0, preR: "", description: "")
    
  //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
    
    @Published var ArtClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var BusinessClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var EnglishClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    @Published var FacsClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var TechEdClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var MathClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var MusicClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var PhyEdClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var ScienceClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var SSClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var WorkClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0, 50], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var LanguageClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0, 100], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var OtherClasses: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
    
    @Published var Departments: [[gradeModel]] = [[gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]]
    
    init(){
        initFunc()
    }
    
    func initFunc(){
        
        fetchArtClasses()
        fetchBusinessClasses()
        fetchFacsClasses()
        fetchEnglishClasses()
        fetchTechClasses()
        fetchMathClasses()
        fetchMusicClasses()
        fetchPEClasses()
        fetchScienceClasses()
        fetchSSClasses()
        fetchWorkClasses()
        fetchLanguageClasses()
        
    //    Departments.append(ArtClasses)
            
       GlobalVar.Departments = [ArtClasses, BusinessClasses, EnglishClasses, FacsClasses, TechEdClasses, MathClasses, MusicClasses, PhyEdClasses, ScienceClasses, SSClasses, WorkClasses, LanguageClasses]
      //  print(GlobalVar.Departments[3])
        
    }
    
    func fetchBusinessClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["Business"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.BusinessClasses = returnedItems
                  self?.BusinessClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          addOperations(operation: queryOperation)
         }

    func fetchEnglishClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["English"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.EnglishClasses = returnedItems
                  self?.EnglishClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
          addOperations(operation: queryOperation)
         }

    func fetchFacsClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["Facs"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.FacsClasses = returnedItems
                  self?.FacsClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
          addOperations(operation: queryOperation)
         }

    func fetchTechClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["Tech Ed"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.TechEdClasses = returnedItems
                  self?.TechEdClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
          addOperations(operation: queryOperation)
         }

    func fetchMathClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["Math"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.MathClasses = returnedItems
                  self?.MathClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
          addOperations(operation: queryOperation)
         }

    func fetchMusicClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["Music"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.MusicClasses = returnedItems
                  self?.MusicClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
          addOperations(operation: queryOperation)
         }

    func fetchPEClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["PhyEd/Health"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.PhyEdClasses = returnedItems
                  self?.PhyEdClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
          addOperations(operation: queryOperation)
         }

    func fetchScienceClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["Science"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.ScienceClasses = returnedItems
                  self?.ScienceClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
          addOperations(operation: queryOperation)
         }

    func fetchSSClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["Social Studies"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.SSClasses = returnedItems
                  self?.SSClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
          addOperations(operation: queryOperation)
         }

    func fetchWorkClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["Work"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.WorkClasses = returnedItems
                  self?.WorkClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
          addOperations(operation: queryOperation)
         }

    func fetchLanguageClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["World Language"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.LanguageClasses = returnedItems
                  self?.LanguageClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
          addOperations(operation: queryOperation)
         }
    
    func fetchArtClasses(){
          let predicate = NSPredicate(format: "department = %@", argumentArray: ["Art"])
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
                  case .failure(let error):
                      print("Record matched error: \(error)")
                  }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.ArtClasses = returnedItems
                  self?.ArtClasses.remove(at: 0)
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
          addOperations(operation: queryOperation)
         }

    
    func fetchAllItems(){
      
        let predicate = NSPredicate(format: "department = %@", argumentArray: ["Art"])
       //   let predicate = NSPredicate(value: true)
          let query = CKQuery(recordType: "Class", predicate: predicate)
          let queryOperation = CKQueryOperation(query: query)
          
          var returnedItems: [gradeModel] = [gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")]
                                    
          
          queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
              switch returnedResult{
              case .success(let record):
                  guard let name = record["name"] as? String else{ return }
                  guard let gradeList = record["gradeList"] as? [Double] else { return }
                  guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                  guard let prerequisites = record["prerequisites"] as? String else { return }
                  guard let description = record["description"] as? String else{ return }
                  guard let department = record["department"] as? String else{return}
               //   guard let userId = record["userID"] as? String else{ return }
                  returnedItems.append(gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department))
              case .failure(let error):
                  print("Record matched error: \(error)")
              }
              
          }
          
          queryOperation.queryResultBlock = { [weak self]returnedResult in
              print(returnedResult)
              DispatchQueue.main.async {
                  self?.classList = returnedItems
              }
          }
        //  let departmentList = ["Art", "Business", "English", "Facs", "Tech Ed", "Math", "Music", "PhyEd/Health", "Science", "Social Studies", "Work", "World Language" ]
        
          
      
          
          addOperations(operation: queryOperation)
          
          
          
         }
   
    func fetchItems(){
        
      //  @AppStorage("className") var className: String = ""
        
        let predicate = NSPredicate(format: "name = %@", argumentArray: [className])
      //  let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Class", predicate: predicate)
        //query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.resultsLimit = 1
        
        var returnedItems: gradeModel = gradeModel(name: "", record: CKRecord(recordType: "Class"), gradeList: [0.0], homeworkList: [0.01], prerequisites: "", description: "", department: "")
                                                   //, description: "", userId: "")
        
        
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult{
            case .success(let record):
                guard let name = record["name"] as? String else{ return }
                guard let gradeList = record["gradeList"] as? [Double] else { return }
                guard let homeworkList = record["homeworkList"] as? [Double] else { return }
                guard let prerequisites = record["prerequisites"] as? String else { return }
                guard let description = record["description"] as? String else{ return }
                guard let department = record["department"] as? String else{return}
             //   guard let userId = record["userID"] as? String else{ return }
                returnedItems = gradeModel(name: name, record: record, gradeList: gradeList, homeworkList: homeworkList, prerequisites: prerequisites, description: description, department: department)
                                           //, description: desciption, userId: userId)
                
            case .failure(let error):
                print("Record matched error: \(error)")
            }
            
        }
        
        queryOperation.queryResultBlock = { [weak self]returnedResult in
            print(returnedResult)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
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
          //  record["userID"] = [userId]
            saveItem(record: record)
            
        }else{
        
        let record = grade.record
        var newList = grade.gradeList
       // var newUserList = grade.userId
        newList.append(num)
     //   newUserList.append(userId)
       // record["userID"] = newUserList
        record["gradeList"] = newList
        saveItem(record: record)
        }
        
    }
    
    func updateHomework(grade: gradeModel, num: Double){
        if grade.homeworkList == [0.01]{
            let record = grade.record
            print("ok")
            record["homeworkList"] = [num]
          //  record["userID"] = [userId]
            saveItem(record: record)
            
        }else{
        
        let record = grade.record
        var newList = grade.homeworkList
     //   var newUserList = grade.userId
     //   newUserList.append(userId)
        newList.append(num)
        record["homeworkList"] = newList
       // record["userID"] = newUserList
        saveItem(record: record)
        }
        
    }
    
    
    func addItem(name: String, num: Double){
        
        let newClass = CKRecord(recordType: "Class")
        newClass["name"] = name
        newClass["gradeList"] = [num]
        newClass["homeworkList"] = [0.01]
        saveItem(record: newClass)
        
    }
    
    func addItemHW(name: String, num: Double){
        
        let newClass = CKRecord(recordType: "Class")
        newClass["name"] = name
        newClass["gradeList"] = [0.0]
        newClass["homeworkList"] = [num]
        saveItem(record: newClass)
        
    }
    
    func addClass(name: String, prerequisites: String, description: String, department: String){
        let newClass = CKRecord(recordType: "Class")
        newClass["name"] = name
        newClass["prerequisites"] = prerequisites
        newClass["description"] = description
        newClass["department"] = department
        newClass["homeworkList"] = [0.01]
        newClass["gradeList"] = [0.0]
      //  newClass["userID"] = userId
        saveItem(record: newClass)
        
        
        
    }
    

     func saveItem(record: CKRecord){
        CKContainer.default().publicCloudDatabase.save(record) { [weak self] returnedRecord, returnedError in
            print(returnedRecord)
         //   print("Error: \(returnedError)")
          //  DispatchQueue.main.async {
            //    self?.fetchItems()
           // }
            
            
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
    
    func averageGradeRounded(gradeList: [Double]) -> String{
        var averageGrade: Double = 0.0
        var count = 0.0
        for grade in gradeList{
            
            averageGrade += grade
            count+=1
            }
        let y = Double(round(1*(averageGrade/count))/1)
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


