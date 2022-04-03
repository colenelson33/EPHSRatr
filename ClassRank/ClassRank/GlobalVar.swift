//
//  GlobalVar.swift
//  ClassRank
//
//  Created by 90304588 on 3/30/22.
//

import Foundation

struct GlobalVar{
    
    static let MathClasses = [CalcClass, Algebra2Class, PreCalcClass, Algebra1Class, Calc3Class, CspClass, CybersecurityClass, FSTClass]
    static let CalcClass = ClassData(className: "AP Calculus", averageGrade: 90.0, Teacher: "Jen Nelson")
    static let Algebra2Class = ClassData(className: "Algebra 2", averageGrade: 90.0, Teacher: "Jen Nelson")
    static let PreCalcClass = ClassData(className: "PreCalc", averageGrade: 90.0, Teacher: "Jen Nelson")
    static let Algebra1Class = ClassData(className: "Algebra 1", averageGrade: 90.0, Teacher: "Jen Nelson")
    static let Calc3Class = ClassData(className: "Calculus 3", averageGrade: 90.0, Teacher: "Jen Nelson")
    static let CspClass = ClassData(className: "Computer Science Principles", averageGrade: 90.0, Teacher: "Jen Nelson")
    static let CybersecurityClass = ClassData(className: "Cybersecurity", averageGrade: 90.0, Teacher: "Jen Nelson")
    static let FSTClass = ClassData(className: "FST", averageGrade: 90.0, Teacher: "Jen Nelson")
}
