//
//  GlobalVar.swift
//  ClassRank
//
//  Created by 90304588 on 3/30/22.
//

import Foundation

struct GlobalVar{
    
    static let MathClasses = [CalcClass, Algebra2Class, PreCalcClass, Algebra1Class, Calc3Class, CspClass, CybersecurityClass, FSTClass]
    static let CalcClass = ClassData(className: "AP Calc", averageGrade: "A-")
    static let Algebra2Class = ClassData(className: "Algebra 2", averageGrade: "B+")
    static let PreCalcClass = ClassData(className: "PreCalc", averageGrade: "A")
    static let Algebra1Class = ClassData(className: "Algebra 1", averageGrade: "A")
    static let Calc3Class = ClassData(className: "Calculus 3", averageGrade: "A")
    static let CspClass = ClassData(className: "Computer Science Principles", averageGrade: "A")
    static let CybersecurityClass = ClassData(className: "Cybersecurity", averageGrade: "A")
    static let FSTClass = ClassData(className: "FST", averageGrade: "A")
}
