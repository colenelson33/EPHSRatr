//
//  GlobalVar.swift
//  ClassRank
//
//  Created by 90304588 on 3/30/22.
//

import Foundation
import SwiftUI


struct ListData: Identifiable,Hashable {
    var id = UUID()
    var title: String
    var teacherList: Array<String>
    var classesNum: Int
    var Image: String
    var Color: Color
    var percentage: GLfloat
    var departmentIndex: Int
}
extension Color {
    static let pinkColor = Color(red: 227 / 255, green: 133 / 255, blue: 180 / 255)
    static let purpleColor = Color(red: 123 / 255, green: 119 / 255, blue: 233 / 255)
    static let OrangeColor = Color(red: 240 / 255, green: 146 / 255, blue: 171 / 255)
}

var data = [
    ListData(title: "Art", teacherList: ["Amanda Budde", "Nancy Gallas", "Christopher True"], classesNum: GlobalVar.ArtClasses.count, Image: "LazyGrid",Color: Color.red, percentage: 0.30, departmentIndex: 0),
    ListData(title: "Business & Marketing", teacherList: ["iOS","SwiftUI", "Xcode"], classesNum: GlobalVar.BusinessClasses.count, Image: "LazyGrid2",Color: Color.red, percentage: 0.25, departmentIndex: 1),
    ListData(title: "English", teacherList: ["iOS","SwiftUI", "Xcode"], classesNum: GlobalVar.EnglishClasses.count, Image: "themeDetector",Color: Color.red, percentage: 0.10, departmentIndex: 2),
    ListData(title: "Family & Consumer Sciences", teacherList: ["iOS","SwiftUI", "Xcode"], classesNum: GlobalVar.famCons.count, Image: "try1",Color: Color.red, percentage: 0.45, departmentIndex: 3),
    ListData(title: "Industrial Technology", teacherList: ["iOS","SwiftUI", "Xcode"], classesNum: GlobalVar.industrialTechClasses.count, Image: "themeDetector",Color: Color.red, percentage: 0.86, departmentIndex: 4),
    ListData(title: "Math", teacherList: ["iOS","SwiftUI", "Xcode"], classesNum: GlobalVar.MathClasses.count, Image: "LazyGrid",Color: Color.red, percentage: 0.30, departmentIndex: 5),
    ListData(title: "Music", teacherList: ["iOS","SwiftUI", "Xcode"], classesNum: GlobalVar.MusicClasses.count, Image: "LazyGrid2",Color: Color.red, percentage: 0.25, departmentIndex: 6),
    ListData(title: "Phy Ed/Health", teacherList: ["iOS","SwiftUI", "Xcode"], classesNum: GlobalVar.phyEdClasses.count, Image: "themeDetector",Color: Color.red, percentage: 0.10, departmentIndex: 7),
    ListData(title: "Science", teacherList: ["iOS","SwiftUI", "Xcode"], classesNum: GlobalVar.ScienceClasses.count, Image: "try1",Color: Color.red, percentage: 0.45, departmentIndex: 8),
    ListData(title: "Social Studies", teacherList: ["iOS","SwiftUI", "Xcode"], classesNum: GlobalVar.SocialClasses.count, Image: "themeDetector", Color: Color.red, percentage: 0.86, departmentIndex: 9),
    ListData(title: "Work Experience", teacherList: ["This", "That", "More"], classesNum: GlobalVar.WorkExperienceClasses.count, Image: "", Color: Color.red, percentage: 0.22, departmentIndex: 10),
    ListData(title: "World Language", teacherList: ["This", "That", "More"], classesNum: GlobalVar.WorldLanguageClasses.count, Image: "", Color: Color.red, percentage: 0.22, departmentIndex: 11)
]

struct GlobalVar{
    
    static var inGuestView: Bool = true
    
    static var currentGrade: Double = 100.0
    
    static let DepartmentList = [ArtClasses, BusinessClasses, EnglishClasses, famCons, industrialTechClasses, MathClasses, MusicClasses, phyEdClasses, ScienceClasses, WorkExperienceClasses, WorldLanguageClasses]
  
    static let ArtClasses = [iOS, ios2, iOS, iOS, iOS]
    
    static let BusinessClasses = [iOS, ios2, iOS, iOS, iOS]
    
    static let EnglishClasses = [iOS, ios2, iOS, iOS, iOS]
    
    static let famCons = [iOS, ios2, iOS, iOS, iOS]
    
    static let industrialTechClasses = [iOS, ios2, iOS, iOS, iOS]
    
    static let MathClasses = [iOS, Algebra, Algebra2, Algebra2S, AT, CalcAB, Calc3, CSP, Cyber, FST, FST2, FST3, Geo, ios2, preCalc, stats, alg2, honorsGeo, honorsPreCalc, calcAP, calcAPbc, apcsp, apcsa, apstats]
    
    static let MusicClasses = [iOS, ios2, iOS, iOS, iOS]
    
    static let phyEdClasses = [iOS, ios2, iOS, iOS, iOS]
    
    static let ScienceClasses = [iOS, ios2, iOS, iOS, iOS]
    
    static let SocialClasses = [iOS, ios2, iOS, iOS, iOS]
    
    static let WorkExperienceClasses = [iOS, ios2, iOS, iOS, iOS]
    
    static let WorldLanguageClasses = [iOS, ios2, iOS, iOS, iOS]
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    static let iOS = ClassData(className: "Advanced iOS Mobile App Development", averageGrade: 90.0, Teacher: "Jen Nelson", credits: 2, preR: "iOS Mobile App Development AND both AP Computer Science A: Java AND AP Computer Sci Principles", description: "Extend your learning from iOS, develop new apps, go further with your first project - learn a new section of swift.  Successful completion of BOTH AP CSP and AP CS A (Java) are required for a second year of iOS.")
    static let Algebra = ClassData(className: "Algebra 1 A&B", averageGrade: 87.2, Teacher: "", credits: 2, preR: "None", description: "All students who have not successfully completed Algebra I (linear algebra) in middle school or another school district must complete this course. This course will use a variety of instructional methods to engage students in the study of algebra. After successful completion of Algebra I, students should enroll in Geometry.")
    static let Algebra2 = ClassData(className: "Algebra II A&B", averageGrade: 90.2, Teacher: "", credits: 2, preR: "Algebra I and Geometry", description: "Students must register for both terms A & B of this course. Successful completion of the Algebra II course is a graduation requirement. This course provides the foundation for the study of advanced mathematics. Topics include:  linear, quadratic, and polynomial functions. Students will simplify complex expressions, powers, and roots, and solve equations, inequalities, and systems of equations through graphing and algebraic reasoning. The topics of sequences and series and an introduction to complex numbers are also explored in Algebra II. After successful completion of Algebra II, students should enroll in FST.")
    static let Algebra2S = ClassData(className: "Algebra II Standards A&B", averageGrade: 32.2, Teacher: "", credits: 2, preR: "Teacher Recommendation Only", description: "The Algebra II Standards Based course provides the foundation for the study of advanced mathematics. Topics include: linear, quadratic, polynomial, radical, and exponential functions. There is extensive work on simplification of expressions, powers, and roots, solving equations and inequalities, and solving systems of equations. This course is specifically designed for students who have been identified by their counselor or previous mathematics teacher as needing a more individualized, standards-based curriculum as opposed to the traditional or accelerated Algebra II curriculum.")
    
    static let AT = ClassData(className: "Algebra & Trigonometry A&B", averageGrade: 20.0, Teacher: "", credits: 2, preR: "FST", description: "College Credit Available... This course is a great start to a student’s college transcript!  It is recommended for students who are college bound, but do not necessarily desire to be math majors. Algebra & Trigonometry emphasizes the properties of functions and their graphs. Concepts covered throughout the two terms of the course are: linear, quadratic, polynomial, rational, exponential and logarithmic functions as well as matrices, determinants, conic functions and trigonometry. Other topics include solving equations, inequalities, and systems of equations. This course is not open to students who have successfully completed Pre-calculus with a “B” or better.")
    
    static let CalcAB = ClassData(className: "Calculus A&B", averageGrade: 82.0, Teacher: "", credits: 2, preR: "Pre-Calculus or Honors Pre-Calculus", description: "An introduction to calculus that does not count for college credit. This course is for students planning to take calculus in college. - OR - For regular Precalculus students (grade B or higher recommended) and Honors Precalculus students who want to solidify their computational calculus skills, this course provides a bridge to take the more application-based AP Calculus the following year.  Topics include limits, derivatives, integrals, and their applications.")
    
    static let Calc3 = ClassData(className: "Calculus 3 -­ Multivariable Calculus", averageGrade: 70.2, Teacher: "Price", credits: 2, preR: "AP BC Calculus", description: "This course offers the opportunity to those students who have completed the AP Calculus curriculum as underclassmen to continue in a college level math course. The students can expect the same rigor as in the AP classes as they explore rectangular, parametric and polar functions, vectors and graphs in more than two dimensions.")
    
    static let CSP = ClassData(className: "Computer Science Principles", averageGrade: 21.2, Teacher: "Jenn Nelson and Breed", credits: 2, preR: "Read & write at grade level", description: "You will learn how to design and build mobile apps - apps that are aware of their location, drawing apps that integrate with your camera, and completely original apps that you plan, design, code and test. The only limit is your own imagination. But computer science is not just about coding. So, we will also learn broadly about the fundamental principles of computer science. We’ll learn about the potential and the limitations of computing and coding. We'll learn how the Internet works and how encryption is used to protect our Internet transactions. We’ll learn about the positive and negative aspects of computing in today's society. We’ll learn about the growing career opportunities in the wide field of computer science.")
    
    static let Cyber = ClassData(className: "Cybersecurity", averageGrade: 100.0, Teacher: "Jenn Nelson", credits: 2, preR: "None", description: "This course covers the basic ways that criminals and security experts break—and break into— computer systems. The topics included in this course will change as “black hats” find new ways to infiltrate networks, stand-alone machines, smartphones, and, of course, personal computers ... Several possible topics could be Denial of Service attacks, phishing scams, the Internet of Things, Trojan horses, and ransomware. Students will learn about these topics by hacking into password-protected machines; reading scientific publications and security reports; analyzing, and then writing, malicious software; and researching operating system exploits, including those in iOS, Android, and Windows.")
    
    static let FST = ClassData(className: "FST (Functions, Statistics, and Trigonometry) A&B", averageGrade: 90.0, Teacher: "", credits: 2, preR: "Algebra II and Geometry", description: "Blended FST is a self-paced mastery method designed course with three levels of content completion: FST Standards, FST, and Honors FST. Students will move at a personalized pace to master each concept of the course. Instruction in this course is through video lessons, peer collaboration, and small group instruction...This course provides the foundation for the study of advanced mathematics and continues the topics presented in Algebra II. FST topics include: linear, quadratic, polynomial, radical, rational, exponential, trigonometric functions, probability, and statistics...Successful completion of the Standards FST course meets all graduation requirements, but does not meet the prerequisites for any other math course at EPHS. Students who complete FST will be equipped to take College Algebra, Pre-Calculus, Statistics and Data Science, or AP Statistics. Students completing Honors FST are also eligible for Honors Pre-Calculus in addition to those aforementioned courses.")
    
    static let FST2 = ClassData(className: "FST (Functions, Statistics, and Trigonometry) Blended", averageGrade: 90.1, Teacher: "", credits: 2, preR: "Algebra II and Geometry", description: "Blended FST is a self-paced mastery method designed course with three levels of content completion: FST Standards, FST, and Honors FST. Students will move at a personalized pace to master each concept of the course. Instruction in this course is through video lessons, peer collaboration, and small group instruction.")
    
    static let FST3 = ClassData(className: "FST Standards (Functions, Statistics, and Trigonometry) A&B", averageGrade: 90.3, Teacher: "", credits: 2, preR: "Algebra II or Algebra II Standards (Teacher Recommendation Only)", description: "This class is not for students who have completed Honors Algebra II or Pre-Calculus and beyond. Successful completion of FST Standards, FST, Statistics and Analytics, or AP Statistics is a graduation requirement...Students must register for both terms A & B of this course...This course provides students an opportunity to learn and demonstrate mastery of the remaining math standards required for graduation and continues the topics presented in Algebra 2. Topics include: linear, quadratic, polynomial, radical, rational, exponential, and trigonometric (right triangle) functions. Statistics is a strong component of this course. This course has been designed for those who have completed Algebra II or Algebra II Standards.")
    
    static let Geo = ClassData(className: "Geometry A&B", averageGrade: 90.5, Teacher: "", credits: 2, preR: "Algebra 8 or Honors Algebra 8 (at CMS) or Algebra I (at EPHS)", description: "Students will study the language, logic, and applications of geometry.  Students will communicate their problem solving skills, construct logical arguments, and analyze patterns to measure the world around them in terms of space, shape and size. After successful completion of Geometry, students should enroll in Algebra II. Students who are successful in Geometry often go on to take AP Computer Science Principles.")
    
    static let ios2 = ClassData(className: "iOS Mobile App Development", averageGrade: 100.0, Teacher: "Jenn Nelson", credits: 2, preR: "AP Computer Sci Principles or AP Computer Science A: Java", description: "Learn the basics of mobile app development for the iOS platform, including iPhone, iPad, Watch and Apple TV.  Successful completion of either AP Computer Science A: Java or AP Computer Sci Principles and passing (3 or greater) of either AP exam is required.")
    
    static let preCalc = ClassData(className: "Pre-Calculus A&B", averageGrade: 20.1, Teacher: "", credits: 2, preR: "Honors Algebra II or FST", description: "This course should be taken by students who want to be challenged by higher level thinking and analysis in the world of mathematics. NOT Reccommended for Jax Surprise. The main emphasis of the course is to expand on Algebra II, FST, and Geometry by a more in depth study of functions, graphing (graphical analysis), and trigonometry as well as other advanced topics beyond the scope of previous courses.  Students are required to have a graphing calculator for this course (recommended Texas Instruments TI-89 or TI-84 calculator). Students who are successful (B or higher) in Pre-Calculus often go on to take Calculus, AP Calculus, AP Computer Science A (Java), Statistics and Data Science, and/or AP Statistics.")
    
    static let stats = ClassData(className: "Statistics and Data Science A&B", averageGrade: 23.2, Teacher: "", credits: 2, preR: "Honors Algebra II or FST", description: "Statistics and Data Science provides a practical introduction to descriptive and inferential statistics. Students learn statistical reasoning: collecting data, analyzing data, and making reasonable conclusions. Use of technology will be prominent. Throughout the course, students complete investigations on topics of their choice that require statistical reasoning and focus on clear, concise communication of technical information. This course is an excellent preparation for college-level statistics and can be taken concurrently with other math courses.")
    
    static let alg2 = ClassData(className: "Honors Algebra II A&B", averageGrade: 30.3, Teacher: "", credits: 2, preR: "Honors Geometry or Geometry (per teacher recommendation only)", description: "Expectations include mastery of Algebra I concepts. Students should be able to work independently and in groups and be highly motivated and willing to accept a challenge. This is a fast paced and rigorous course. In addition to topics covered in Algebra II, enriched units may include advanced functions, complex numbers, solving polynomials, logarithms, and analytic trigonometry. Students who complete Honors Algebra II must also complete either AP Statistics or Statistics and Data Science in order to meet graduation requirements. In addition, students who are successful in Honors Algebra II often go on to take Pre-calculus or Honors Pre-calculus.")
    
    static let honorsGeo = ClassData(className: "Honors Geometry A&B", averageGrade: 20.2, Teacher: "", credits: 2, preR: "Honors Algebra 8, or teacher recommendation", description: "Honors Geometry students will study the language, logic and applications of geometry. Students will communicate their problem solving skills, construct logical arguments, and analyze patterns to measure the world around them in terms of space, shape and size. Enrichment comes in the form of more challenging projects, significant emphasis on written work associated with projects, challenge-of-the-mind exercises and more challenging daily work. After successful completion of Honors Geometry, students should enroll in either Algebra II or Honors Algebra II. Students who are successful in Honors Geometry often go on to take AP Computer Science Principles.")
    
    static let honorsPreCalc = ClassData(className: "Honors Pre-Calculus A&B", averageGrade: 21.2, Teacher: "", credits: 2, preR: "Honors Algebra II or teacher recommendation", description: "This course should be taken by students who want to be challenged by higher-level thinking and analysis in the world of mathematics. The core curriculum is the same as Pre-Calculus with the addition of honors level extensions and discussions of advanced topics. Students are required to have a graphing calculator for this course (recommended Texas Instruments TI-89 or TI-84 calculator).  Students who are successful (A- or higher) in Honors Pre-Calculus often go on to take Calculus, AP Calculus, AP Computer Science A (Java), Statistics and Data Science, and/or AP Statistics.")
    
    static let calcAP = ClassData(className: "AP AB Calculus A&B", averageGrade: 10.2, Teacher: "", credits: 2, preR: "Pre-Calculus or Honors Pre-Calculus", description: "This course offers an environment where students can study, learn, and make discoveries in the different areas of calculus. A graphing calculator is required for the course (TI-84, TI-89 or TI-Nspire are recommended). Although students can take this course alone and take the AP AB Calculus exam in May, it is highly recommended that students continue on to AP BC Calculus in the same year.  We have found that by doing this, students tend to score better on the AP exams, and are also in a position to take Calculus 3 (Multivariable Calculus) the following year. ")
    
    static let calcAPbc = ClassData(className: "AP BC Calculus A&B", averageGrade: 10.2, Teacher: "", credits: 2, preR: "AP AB Calculus or, in some cases, regular Calculus with instructor approval.", description: "This course is a continuation of the AP AB Calculus curriculum and it prepares students for the AP BC Calculus exam in May.  Those who complete the AP AB Calculus course should expect the same rigor.  While it is possible to take AP AB Calculus and AP BC Calculus in separate years, it is highly recommended that all four terms be completed in the same year.  We have found that by doing this, students tend to score better on the AP exam and are also in a position to take Calculus 3 (Multivariable Calculus) the following year.")
    
    static let apcsp = ClassData(className: "AP Computer Sci Principles A&B", averageGrade: 10.2, Teacher: "Jenn Nelson/Jessica Breed", credits: 2, preR: "Read & write at grade level", description: "A rigorous, fast-paced course that gets you ready for the AP CSP exam (given nationally in May). We practice computational thinking and learn about the wide field of computer science. Some days we are writing code in MIT App Inventor, reading about DDoS attacks, arguing about whose job it is to provide internet access to all (or some), or working in teams to solve puzzles, practice sorting algorithms or create post-it art. We discuss the impact that Big Data has on our world, what happened to our privacy and what is double factor authentication among other topics. As an AP level class, we will build a digital portfolio to send to the College Board; read and write critically about data and algorithms; and prepare for the rigorous AP multiple choice test in the spring.")
    
    static let apcsa = ClassData(className: "AP Computer Science A: Java A&B", averageGrade: 100.0, Teacher: "Jenn Nelson", credits: 2, preR: "AP CSP or Honors Algebra II or FST", description: "AP CS A: Java is a challenging course that prepares you for the AP CS A: Java exam offered in May. Most students who take Java intend to take (or have taken) Precalculus. This course requires deep thinkers who love to problem solve. Figuring out why algorithms work (or don't), anticipating challenges and celebrating when everything is successful make this a rewarding adventure in computing. AP CS A: Java is an ideal course before starting the calculus sequence. Increasing your logical thinking skills, revealing how algorithms function and making your thinking transparent will help you in future mathematics, science, and engineering courses. We work hard, tackle complex problems, and create inventive solutions.")
    
    static let apstats = ClassData(className: "AP Statistics", averageGrade: 100.0, Teacher: "", credits: 2, preR: "Honors Algebra II OR FST", description: "Preparation for the AP exam will be provided in class and students are strongly encouraged to take the examination. Advanced Placement Statistics will introduce students to the major concepts and tools for collecting data, analyzing data, and drawing conclusions from data. The course follows four broad conceptual themes: Exploring Data: Observing patterns and departures from patterns; Planning a Study: Deciding what and how to measure; Anticipating Patterns: Producing models using probability and simulation; and Statistical Inference: Estimating parameters and testing hypotheses. Students are required to have a graphing calculator for this course (recommended Texas Instruments TI-89 or TI-84).")
}

class Card{
    var txt: String
    var activity: String
    var sysimages: String
    var opacityVal: Double
    var cardIndex: Int
    
   
    init(txt: String, activity: String, sysimages: String, opacityVal: Double, cardIndex: Int){
        self.txt = txt
        self.activity = activity
        self.sysimages = sysimages
        self.opacityVal = opacityVal
        self.cardIndex = cardIndex
    }
    
}

//Cards(txt: "Teacher(s)", activity: "Tap for info", sysimages: "figure.wave", opacityVal: 1, cardIndex: 0)
