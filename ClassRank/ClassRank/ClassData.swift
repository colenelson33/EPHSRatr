//
//  ClassData.swift
//  ClassRank
//
//  Created by 90304588 on 3/29/22.
//

import Foundation

class ClassData: Decodable, Identifiable, ObservableObject {
    
    var className: String
    var Teacher: String?
    var credits: Int
    var prerequisite: String
    var description: String
    
   
    init(className: String, Teacher: String, credits: Int, preR: String, description: String){
        self.className = className
        self.Teacher = Teacher
        self.credits = credits
        self.prerequisite = preR
        self.description = description
    }
}

extension GlobalVar{
    
    static let WorldLanguageClasses = [advHeritageSpanish, advSpanishImmersion3, advancedSpanish3, advancedSpanish4, apSpanishLitandCulture, americanSignLanguage1, asl2, asl3, Chinese1, chinese2, chinese3, chinese4, chinese5, french1, french2, french3, french4, french5, french6, german1, german2, german3, german4, german5, spanish1, spanish2, spanish3, spanish4, spanish5, spanish6]
    
    static let ScienceClasses = [advHeritageSpanish, advSpanishImmersion3, advancedSpanish3, advancedSpanish4, apSpanishLitandCulture, americanSignLanguage1, asl2, asl3, Chinese1, chinese2, chinese3, chinese4, chinese5, french1, french2, french3, french4, french5, french6, german1, german2, german3, german4, german5, spanish1, spanish2, spanish3, spanish4, spanish5, spanish6]
    
    
    Advanced Biology: Anatomy/Physlgy
    03054E12 / 03054E22

    2 credits  |  10  |  11  |  12  |

    Prerequisite: Biology A&B and Algebra I

    Note: Students must register for both terms A & B.

    Advanced Biology is designed for students with a great interest in biology who wish to expand their knowledge in the areas of human anatomy and physiology. Students pursuing a health related or medical career may be particularly interested in this class. In term A, living structures will be studied in depth from the cellular level through the macroscopic level; special emphasis is placed on malformations, malfunctions, and diseases. The integumentary, skeletal, muscular, digestive, circulatory and immune systems are covered. Mini-units are also done on medical terms, the history of medicine, and alternative forms of medicine. Term B continues our study of living structures as we learn about the respiratory, endocrine, urinary, reproductive, nervous, and special senses. In addition, an investigative research project related to a controversial issue in medicine is done as well as a formal lab write-up. Systematic dissection of a fetal pig occurs throughout both terms.

    Advanced Biology: Botany/Horticulture
    03058E12 / 03058E22

    2 credits  |  10  |  11  |  12  |

    Prerequisite: Biology A&B

    Note: Students must register for both terms A & B.

    This two term course is offered in the spring. It introduces the student to the great variety of plants in the surrounding world and their significance both environmentally and economically. This course has a strong laboratory component and you must be ok with working outside and getting your hands dirty! Greenhouse work will be part of the course along with individual and/or group research. Numerous home landscaping and plant care topics will be covered.

    AP Biology
    03056E12 / 03056E22

    2 credits  |  11  |  12  |

    Prerequisite: Biology (or Honors) A&B, AND Chemistry (or Honors) A&B

    Note: If you took regular Biology, an “A” average in Biology is highly recommended. Students must register for both terms of the course.

    College Credit Available

    Advanced Placement Biology’s primary goal is to provide students with a challenging college level course and prepare the student for the national AP Biology Exam given in mid-May. Students enrolled in this course are encouraged to take the exam. Based on performance on the exam, students may be granted college credit and/or advanced placement at the discretion of the college or university. The course will include topics regularly covered in a college biology course for majors. The two main goals of AP Biology are to help students develop a conceptual framework for modern biology and an appreciation of science as a process.

    AP Chemistry
    03106E12 / 03106E22

    2 credits  |  11  |  12  |

    Prerequisite: Chemistry A&B or Honors Chemistry A&B and Pre-Calculus

    Note: An “A” average in Chemistry or a “B” average in Honors Chemistry is highly recommended. Students must register for both terms of the course.

    College Credit Available

    This course is similar to a freshman college chemistry course and is designed to strengthen a student’s chemistry background. AP Chemistry will help prepare students who wish to take the AP Exam in May. Based on performance on the exam, students may be granted college credit and/or advanced placement at the discretion of the college or university. Course content in Term A includes: atoms, molecules, ions, solutions, gases, thermochemistry, atomic and molecular structure chemical bonding, liquids, and solids. Course content in Term B includes: chemical kinetics, equilibrium, acid-base systems, oxidation- reduction, solutions and colloids, chemical thermodynamics, and complex ions.

    Content is accessed in part through blended/online learning with elements of student control over time, place, path and/or pace. In addition content will also be acquired through peer learning, group work, and collaborative laboratory experiments.

    AP Environmental Science A&B
    03003E12 / 03003E22

    2 credits  |  9  |  10  |  11  |  12  |

    College Credit Available

    Prerequisite: Two semesters of high school laboratory science, including life science and physical science, along with at least one year of algebra.

    AP Environmental Science is an introductory college-level course in environmental science.  The class and exam focus on seven main topics: Earth Systems and Resources, The Living World, Populations, Land and Water Use, Energy Resources and Consumption, Pollution, and Global Change.  In this class you will explore and investigate the interrelationships of the natural world and analyze environmental problems, both natural and human-made. You’ll take part in laboratory investigations and field work.  Skills you will learn by taking this class include: 1. Explaining environmental concepts and processes; 2. Analyzing data, visual representations, and writings; 3. Applying quantitative methods in solving problems; 4. Proposing a solution for an environmental problem and supporting your idea with evidence; and 5. Analyzing a research study to identify a hypothesis. This course helps to prepare students interested in a possible career in the area of environmental science.

    AP Physics I (or C Mechanics) A&B
    03155E12 / 03155E22

    2 credits  |  10  |  11  |  12  |

    College Credit Available

    Prerequisite: Science 9, Honors Physics, Algebra II and enrollment in (or completion recommended) of Pre-Calc

    Note: A "B" or better in Pre-Calc for the AP Physics 1 exam; Calculus suggested for the Physics C Mechanics exam

    AP Physics is an introductory college-level physics course that completes the development of topics begun in or not treated in the Honors Physics course such as: constrained Newtonian systems, further development of Conservation Laws applied to energy and momentum of systems, Circular Motion, Center of Mass, Torque and Rotational Mechanics, Universal Law of Gravity and Orbital Motion. Through inquiry based learning and laboratory experiences, students will develop scientific critical thinking and reasoning skills and also learn how to use multilevel physics problem solving approaches. Data analysis of mathematical models for experimental questions are also developed. Students will be prepared for either the AP Physics 1 Exam and/or those students who have had Calculus will be given calculus based problems topics to prepare for the AP Physics C mechanics exam.
        
    static let physScience9 = ClassData(className: "Physical Science 9 A&B", Teacher: "", credits: 2, preR: "None", description: "Physical Science A—this course primarily explores introductory chemistry concepts. Major areas covered include atomic structure and periodicity, chemical bonding and formulas, as well as chemical reactions. Also covered in Physical Science A are methods for conducting and reporting on an individual experiment. Physical Science B—this course primarily explores introductory physics concepts. Major areas covered include conversion of units, motion, forces, and energy.  Also covered in Physical Science B is a unit on STEM (Science, Technology, Engineering, and Mathematics) concepts.")
    
    static let honorsPhys = ClassData(className: "Honors Physics A&B", Teacher: "", credits: 2, preR: "Science 9, Algebra II and enrollment in/or completion of Pre-Calculus", description: "In this course the core concepts of physics will be developed using both conceptual and mathematical models based on lab investigations, demonstrations, activities, discussion, and problem solving. The course is specifically designed for students who have a strong interest and background in science and math and will be pursuing further training in science, math, medicine or engineering at college. Most colleges and major universities recommend the completion of a physics course for admission. If you are considering a science related career, you should seriously consider taking Honors Physics. This course is a preparation for some but not all of the learning targets for the AP Physics 1 and the AP Physics C mechanics exam.")
    
    static let hps = ClassData(className: "Honors Physical Science 9 A&B", Teacher: "", credits: 2, preR: "Algebra I", description: "   Honors Physical Science 9 A&B is taught at a faster pace, goes into more depth on selected topics, and looks at some topics with a higher math emphasis than the other Physical Science 9 courses. Honors Physical Science A—this course explores introductory chemistry concepts.  Major areas covered include measurements, atomic structure and periodicity, chemical bonding and formulas, as well as chemical reactions.  Also covered in Honors Physical Science A are methods for conducting research and reporting on an individual experiment. Honors Physical Science B—this course explores introductory physics concepts. Major areas covered include conversion of units, motion, forces, and energy.  Also covered in Honors Physical Science B is a unit on STEM (Science, Technology, Engineering, and Math) concepts.")
    
    static let hChem = ClassData(className: "Honors Chemistry A&B", Teacher: "", credits: 2, preR: "Science 9 and Geometry", description: " In this course chemical principles will be approached in depth and with more of a mathematical approach. Course content includes: atomic and molecular structure, chemical reactions, energy, kinetics, equilibrium, solutions, acid/base, nuclear chemistry and organic chemistry. It is designed for students who are more abstract thinkers, have a strong math background, and are possibly considering taking college chemistry or majoring in a STEM related field. Content is accessed in part through blended/online learning with elements of student control over time, place, path and/or pace. In addition content will also be acquired through peer learning, group work, and collaborative laboratory experiments.")
    
    static let hBio = ClassData(className: "Honors Biology A&B", Teacher: "", credits: 2, preR: "Physical Science A&B or Honors Physical Science 9 A&B", description: "This is an accelerated Biology course.  Although course topics are similar to that of Biology A & B, the rigor and depth of each of those concepts is elevated. Topics of study include: biotechnology, cell structure and function, biochemistry, DNA, cell division, protein synthesis, genetics, evolution, microbiology, animal behavior, and ecology. Students enrolling in this course should be self-motivated and thrive on academic challenge. Course content is accessed in part through blended/online learning with elements of student control over time, place, path and/or pace.")
    
    static let chemBlended = ClassData(className: "Chemistry Blended", Teacher: "", credits: 2, preR: "Prerequisite: Science 9 and Algebra I", description: "This course is designed to provide an introduction to the basic principles of chemistry. Students will study introductory principles; nomenclature, writing and balancing equations, atomic structure, bonding, solutions, stoichiometry, acid/base, and chemical analysis, along with an introduction into organic chemistry. Blended / Hybrid courses are designed and delivered by EPHS staff. They offer a mix of face to face and online instruction.  Course content has elements of student control over time, place, path and/or pace with the goal of affording each student a more personalized learning experience.")
    
    static let chem = ClassData(className: "Chemistry A&B", Teacher: "", credits: 2, preR: "Science 9 and Algebra I", description: " This course is designed to provide an introduction to the basic principles of chemistry. Students will study introductory principles; nomenclature, writing and balancing equations, atomic structure, bonding, solutions, stoichiometry, acid/base, and chemical analysis, along with an introduction into organic chemistry.")
    
    static let bio = ClassData(className: "Biology A&B", Teacher: "", credits: 2, preR: "Science 9 and Algebra I", description: "Biology A - this course presents introductory information and basic skills in the area of ecology,, cell structure and function, biochemistry, DNA, cell division, and protein synthesis. Biology B - this course presents introductory information and basic skills in the area of genetics, evolution,, microbiology,, animal behavior, and biotechnology.")
    
    static let basicphySci = ClassData(className: "Basic Physical Science 9 A&B", Teacher: "", credits: 2, preR: "Teacher recommendation", description: "Basic Physical Science 9 does not go into as much depth on selected topics as Physical Science 9. Basic Physical Science A—this course explores introductory chemistry concepts.  Major areas covered include measurements, atomic structure and periodicity, chemical bonding and formulas, as well as chemical reactions. Also covered in Basic Physical Science A are methods for conducting research and reporting on an individual experiment. Basic Physical Science B—this course explores introductory physics concepts.  Major areas covered include conversion of units, motion, forces, and energy. Also covered in Basic Physical Science B is a unit on STEM (Science, Technology, Engineering, and Math) concepts.")
    
    static let basicChem = ClassData(className: "Basic Chemistry A&B", Teacher: "", credits: 2, preR: "Science 9, Algebra I", description: "Basic Chemistry is an introductory chemistry course where the amount of learning targets are different than that of Chemistry A and B. However the same essential learning targets are covered and students have the entire semester to demonstrate proficiency. If science is a difficult course for you, then basic chemistry would be a good fit. The first term of the course covers writing and naming formulas, identifying chemical reactions, and balancing chemical equations. The second term of the course covers basic mole calculations and drawing molecules.  Students will also have the opportunity of participating in a passion project during each term.")
    
    static let basicBio = ClassData(className: "Basic Biology A&B", Teacher: "", credits: 2, preR: "Any 9th grade science", description: " Basic Biology does not go into as much depth on selected topics as Biology. Biology A - this course presents introductory information and basic skills in the area of the characteristics of living things, the nature of science, ecology, cell structure and function, biochemistry, DNA, cell division, and protein synthesis. Biology B - this course presents introductory information and basic skills in the area of genetics, evolution, microbiology, biotechnology, animal behavior.")
    
    static let apPhys = ClassData(className: "AP Physics I (or C Mechanics) A&B", Teacher: "", credits: 2, preR: "Science 9, Honors Physics, Algebra II and enrollment in (or completion recommended) of Pre-Calc", description: "AP Physics is an introductory college-level physics course that completes the development of topics begun in or not treated in the Honors Physics course such as: constrained Newtonian systems, further development of Conservation Laws applied to energy and momentum of systems, Circular Motion, Center of Mass, Torque and Rotational Mechanics, Universal Law of Gravity and Orbital Motion. Through inquiry based learning and laboratory experiences, students will develop scientific critical thinking and reasoning skills and also learn how to use multilevel physics problem solving approaches. Data analysis of mathematical models for experimental questions are also developed. Students will be prepared for either the AP Physics 1 Exam and/or those students who have had Calculus will be given calculus based problems topics to prepare for the AP Physics C mechanics exam.")
    
    static let apEnviron = ClassData(className: "", Teacher: "", credits: 2, preR: "", description: "")
    
    static let apChem = ClassData(className: "", Teacher: "", credits: 2, preR: "", description: "")
    
    static let apBio = ClassData(className: "", Teacher: "", credits: 2, preR: "", description: "")
        
    static let apBio = ClassData(className: "", Teacher: "", credits: 2, preR: "", description: "")
        
    static let apBio = ClassData(className: "", Teacher: "", credits: 2, preR: "", description: "")
    
    static let advBio = ClassData(className: "", Teacher: "", credits: 2, preR: "", description: "")
    
    static let advHeritageSpanish = ClassData(className: "Adv Comp&Comm Heritage Spanish A&B", Teacher: "", credits: 2, preR: "Spanish spoken in the home", description: "This course is designed for students who speak Spanish in the home and/or are fluent Spanish speakers. In this course, students are able to develop their linguistic ability in association with their written and comprehensive skills. Furthermore, emphasis is also placed on the subjects of communication and Latin American history. This course prepares students for the Bilingual Seal exam, in which they can earn college credit.")
    
    static let advSpanishImmersion3 = ClassData(className: "Advanced Spanish Immersion 3", Teacher: "", credits: 2, preR: "Spanish Language Arts 8 AND Grade 8 teacher recommendation", description: "This course is designed for Spanish immersion students entering high school with attention to enhanced literacy, pronunciation, writing skills, grammar polish, cultural awareness of Spanish speaking countries and transition to Advanced Spanish Immersion 4 and the rigor of college-level courses that follow.")
    
    static let advancedSpanish3 = ClassData(className: "Advanced Spanish Immersion 3", Teacher: "", credits: 2, preR: "Spanish Language Arts 8 AND Grade 8 teacher recommendation", description: "This course is designed for Spanish immersion students entering high school with attention to enhanced literacy, pronunciation, writing skills, grammar polish, cultural awareness of Spanish speaking countries and transition to Advanced Spanish Immersion 4 and the rigor of college-level courses that follow.")
    
    static let advancedSpanish4 = ClassData(className: "Advanced Spanish Immersion 4", Teacher: "", credits: 2, preR: "Advanced Spanish Immersion 3", description: "This course is designed for continuing Spanish immersion students at the high school level, who have successfully completed Advanced Spanish Immersion 3 , with attention to enhanced literacy, pronunciation, writing skills, grammar polish, and cultural awareness of Spanish speaking countries and transition to the rigor of college level courses to follow.")
    
    static let apSpanishLitandCulture = ClassData(className: "AP Spanish Lit and Culture", Teacher: "", credits: 2, preR: "Spanish 6 / SPAN 1004", description: "Students read and analyze Spanish literature from various Spanish speaking countries. The historical period spans from medieval to modern times. In the course students continue to develop proficiencies across the full range of the modes of communication (interpersonal, presentational, and interpretive), honing their critical reading and analytical writing skills. Besides reading, students study the historical context in which the work was made, and they analyze how historical context affects perspective and style of the work. Part of the course requires students to analyze in writing their observations of theme, style, and historical influences on the work. There are 1-2 hours of homework for the course each night, weekly assessments to monitor progress and periodic writing assessments.")
    
    static let americanSignLanguage1 = ClassData(className: "American Sign Language 1 A&B", Teacher: "", credits: 2, preR: "None", description: "Students will learn the basics for communication with deaf individuals. ASL is a visual language and requires participants to maintain eye contact while communicating. The course includes receptive and expressive readiness activities, sign vocabulary, basic rules of grammar, finger spelling, conversational behaviors, and various aspects of Deaf culture. Receptive and expressive sign vocabulary building, introductory conversation, and short narratives are featured.")
    
    static let asl2 = ClassData(className: "American Sign Language 2 A&B", Teacher: "", credits: 2, preR: "American Sign Language 1 A&B - a grade of “C” or better is recommended", description: "Students will continue to learn communication with deaf individuals. The course includes more advanced receptive and expressive activities, sign vocabulary, ASL grammatical structure, finger spelling, conversational behaviors, and various aspects of Deaf culture. Receptive and expressive sign vocabulary building, conversations, short stories and narratives are featured.")
    
    static let asl3 = ClassData(className: "American Sign Language 3 A&B", Teacher: "", credits: 2, preR: "American Sign Language 2 A&B - a grade of “C” or better is recommended.", description: "Students will continue to learn how to communicate with deaf individuals. The course includes advanced receptive and expressive activities, advanced sign vocabulary, sophisticated ASL grammatical structures, conversation behaviors, and various aspects of Deaf culture.")
    
    static let Chinese1 = ClassData(className: "Chinese 1 A&B", Teacher: "老师", credits: 2, preR: "没有", description: "This course is designed for students with little or no background in the target language. (To strengthen skills before Level 2, this course is also recommended for students who earned less than 75% in 7th & 8th grade.) The major emphasis in this course will be on the development of listening and speaking skills. Students will also begin to read and write using basic language structures and investigate relevant cultural traditions.")
    
    static let chinese2 = ClassData(className: "Chinese 2 A&B", Teacher: "老师", credits: 2, preR: "中文一 A&B or two years of 7th & 8th grade language study (recommended grade of 75% or higher), or teacher recommendation", description: "In this semester long course, students will continue to learn the features of language necessary for simple communication in varied applications. In the target language, they will comprehend spoken and written information (including the use of Chinese characters in Chinese II) and communicate simple information. In addition, students will recognize and identify relevant cultural traditions.")
    
    static let chinese3 = ClassData(className: "Chinese 3 A&B", Teacher: "老师", credits: 2, preR: "中文二 A&B", description: "In this semester-long course, students will continue to learn the features of language necessary for basic communication in varied applications. In the target language, students will comprehend spoken and written information and communicate basic information. They will continue to recognize and identify relevant cultural traditions.")
    
    static let chinese4 = ClassData(className: "Chinese 4 A&B", Teacher: "老师", credits: 2, preR: "中文三 A&B", description: "In this semester-long course, students will continue to learn the features of language necessary for communication in more complicated applications. In the target language, they will comprehend spoken and written information and communicate more complicated information. They will continue to recognize relevant cultural traditions.")
    
    static let chinese5 = ClassData(className: "Chinese 5 A&B", Teacher: "老师", credits: 2, preR: "中文四 A&B", description: "In this semester-long course, students will learn the features of language necessary for communication in more complicated applications. In Chinese, they will comprehend spoken and written information and communicate complex information. They will read and write Chinese characters and recognize Chinese cultural traditions.")
    
    static let french1 = ClassData(className: "French 1 A&B", Teacher: "", credits: 2, preR: "None", description: "This course is designed for students with little or no background in the target language. (To strengthen skills before Level 2, this course is also recommended for students who earned less than 75% in 7th & 8th grade.) The major emphasis in this course will be on the development of listening and speaking skills. Students will also begin to read and write using basic language structures and investigate relevant cultural traditions. ")
    
    static let french2 = ClassData(className: "French 2 A&B", Teacher: "", credits: 2, preR: "French 1 A&B or two years of 7th & 8th grade language study (recommended grade of 75% or higher), or teacher recommendation", description: "In this semester long course, students will continue to learn the features of language necessary for simple communication in varied applications. In the target language, they will comprehend spoken and written information and communicate simple information. In addition, students will recognize and identify relevant cultural traditions.")
    
    static let french3 = ClassData(className: "French 3 A&B", Teacher: "", credits: 2, preR: "French 2 A&B", description: "In this semester-long course, students will continue to learn the features of language necessary for basic communication in varied applications. In the target language, students will comprehend spoken and written information and communicate basic information. They will continue to recognize and identify relevant cultural traditions.")
    
    static let french4 = ClassData(className: "French 4 A&B", Teacher: "", credits: 2, preR: "French 3 A&B", description: "n this semester-long course, students will continue to learn the features of language necessary for communication in more complicated applications. In the target language, they will comprehend spoken and written information and communicate more complicated information. They will continue to recognize relevant cultural traditions.")
    
    static let french5 = ClassData(className: "French 5 A&B", Teacher: "", credits: 2, preR: "French 4 A&B...5 Univ of MN College Credits Available", description: "Students enrolling in this course have the option of taking this course for college credit in collaboration with the University of Minnesota’s College in the Schools program. Students will earn 2 EPHS credits and have the option of earning five University of Minnesota credits... This course will follow the curriculum of 1003 University of Minnesota course in the target language. Upon successful completion of this course, students who register for the college credit will earn 5 University of Minnesota credits and an official transcript. Students should anticipate the rigor and challenge associated with a university course.  Evaluations will include written and oral exams, formal compositions, daily homework and participation. Excessive absences are not allowed per the University’s requirements.")
    
    static let french6 = ClassData(className: "French 6 A&B", Teacher: "", credits: 2, preR: "French 5 / FREN 1003", description: "Students enrolling in this course have the option of taking this course for college credit via dual enrollment with the University of Minnesota’s College in the Schools program. Students will earn 2 EPHS credits and have the option of earning five University of Minnesota credits...This course will follow the curriculum of 1004 University of Minnesota course in the target language.  Upon successful completion of this course, students who register for the college credit will earn 5 University of Minnesota credits and an official transcript.  Students should anticipate the rigor and challenge associated with a university course. Evaluations will include written and oral exams, formal compositions, daily homework, and participation. Excessive absences are not allowed per the University’s requirements.")
    
    static let german1 = ClassData(className: "German 1 A&B", Teacher: "", credits: 2, preR: "None", description: "This course is designed for students with little or no background in the target language. (To strengthen skills before Level 2, this course is also recommended for students who earned less than 75% in 7th & 8th grade.) The major emphasis in this course will be on the development of listening and speaking skills. Students will also begin to read and write using basic language structures and investigate relevant cultural traditions.")
    
    static let german2 = ClassData(className: "German 2 A&B", Teacher: "", credits: 2, preR: "German 1 A&B or two years of 7th & 8th grade language study (recommended grade of 75% or higher), or teacher recommendation", description: "In this semester long course, students will continue to learn the features of language necessary for simple communication in varied applications. In the target language, they will comprehend spoken and written information and communicate simple information. In addition, students will recognize and identify relevant cultural traditions.")
    
    static let german3 = ClassData(className: "German 3 A&B", Teacher: "", credits: 2, preR: "German 2 A&B", description: "In this semester-long course, students will continue to learn the features of language necessary for basic communication in varied applications. In the target language, students will comprehend spoken and written information and communicate basic information. They will continue to recognize and identify relevant cultural traditions.")
    
    static let german4 = ClassData(className: "German 4 A&B", Teacher: "", credits: 2, preR: "German 3 A&B", description: "College Credit Available.. Students enrolling in this course have the option of taking this course for college credit in collaboration with the University of Minnesota’s College in the Schools program. Students will earn 2 EPHS credits and have the option of earning five University of Minnesota credits... This course will follow the curriculum of 1003 University of Minnesota course in the target language. Upon successful completion of this course, students who register for the college credit will earn 5 University of Minnesota credits and an official transcript. Students should anticipate the rigor and challenge associated with a university course. Evaluations will include written and oral exams, formal compositions, daily homework and participation. Excessive absences are not allowed per the University’s requirements.")
    
    static let german5 = ClassData(className: "German 5 A&B", Teacher: "", credits: 2, preR: "German 4 / CIS 1003", description: "College Credit Available...Students enrolling in this course have the option of taking this course for college credit in collaboration with the University of Minnesota’s College in the Schools program. Students will earn 2 EPHS credits and have the option of earning five University of Minnesota credits... This course will follow the curriculum of 1004 University of Minnesota course in the target language. Upon successful completion of this course, students who register for the college credit will earn 5 University of Minnesota credits and an official transcript. Students should anticipate the rigor and challenge associated with a university course. Evaluations will include written and oral exams, formal compositions, daily homework, and participation. Excessive absences are not allowed per the University’s requirements.")
    
    static let spanish1 = ClassData(className: "Spanish 1 A&B", Teacher: "", credits: 2, preR: "None", description: "This course is designed for students with little or no background in the target language. (To strengthen skills before Level 2, this course is also recommended for students who earned less than 75% in 7th & 8th grade.) The major emphasis in this course will be on the development of listening and speaking skills. Students will also begin to read and write using basic language structures and investigate relevant cultural traditions.")
    
    static let spanish2 = ClassData(className: "Spanish 2 A&B", Teacher: "", credits: 2, preR: "Spanish 1 A&B or two years of 7th & 8th grade language study (recommended grade of 75% or higher), or teacher recommendation", description: "In this semester long course, students will continue to learn the features of language necessary for simple communication in varied applications. In the target language, they will comprehend spoken and written information and communicate simple information. In addition, students will recognize and identify relevant cultural traditions.")
    
    static let spanish3 = ClassData(className: "Spanish 3 A&B", Teacher: "", credits: 2, preR: "Spanish 2 A&B", description: "In this semester-long course, students will continue to learn the features of language necessary for basic communication in varied applications. In the target language, students will comprehend spoken and written information and communicate basic information. They will continue to recognize and identify relevant cultural traditions.")

    static let spanish4 = ClassData(className: "Spanish 4 A&B", Teacher: "", credits: 2, preR: "Spanish 3 A&B", description: "In this semester-long course, students will continue to learn the features of language necessary for communication in more complicated applications. In the target language, they will comprehend spoken and written information and communicate more complicated information. They will continue to recognize relevant cultural traditions.")
    
    static let spanish5 = ClassData(className: "Spanish 5 A&B", Teacher: "", credits: 2, preR: "Spanish 4 A&B or Advanced Spanish Immersion 10 A&B", description: "5 Univ of MN College Credits Available...Students enrolling in this course have the option of taking this course for college credit via dual enrollment with the University of Minnesota’s “College in the Schools” program. Students will earn 2 EPHS credits and have the option of earning five University of Minnesota credits....This course will follow the curriculum of the University of Minnesota course, Spanish 1003, in the target language.  Upon successful completion of this course, students who register for the college credit will earn 5 University of Minnesota credits and an official transcript.   Students should anticipate the rigor and challenge associated with a university course.  Evaluations will include written and oral exams, formal compositions, daily homework and participation. Excessive absences are not allowed per the University’s requirements. ")
    
    static let spanish6 = ClassData(className: "Spanish 6 A&B", Teacher: "", credits: 2, preR: "Spanish 5 / SPAN 1003", description: "5 Univ of MN College Credits Available... Students enrolling in this course have the option of taking this course for college credit via dual enrollment with the University of Minnesota’s College in the Schools program. Students will earn 2 EPHS credits and have the option of earning five University of Minnesota credits...This course will follow the curriculum of Spanish 1004 University of Minnesota course in the target language.  Upon successful completion of this course, students who register for the college credit will earn 5 University of Minnesota credits and an official transcript. Students should anticipate the rigor and challenge associated with a university course. Evaluations will include written and oral exams, formal compositions, daily homework, and participation. Excessive absences are not allowed per the University’s requirements.")
    
    static let SocialClasses = [apstats, apstats, apstats]
    
    static let WorkExperienceClasses = [apstats, apstats, apstats]
    
    
    
    
}


