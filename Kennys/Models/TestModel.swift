//
//  TestModel.swift
//  Kennys
//
//  Created by Nick Morris on 9/25/21.
//

import Foundation

struct testForm {
    let question : String
    let answer1 : String
    let answer2: String
    let answer3: String
    let answer4: String
    let correct: String
}
let questions = [
    testForm(question: "How Many Presidents died on July 4th?", answer1: "1", answer2: "2", answer3: "3", answer4: "4", correct : "3"),
    testForm(question: "What is Barbie's full name?", answer1: "Barbie", answer2: "Barbara Millicent Roberts", answer3: "Barbie the Beautiful", answer4: "Barbra", correct : "Barbara Millicent Roberts"),
    testForm(question: "How tall was the tallest man ever?", answer1: "8 feet 11 inches", answer2: "7 feet 6 inches", answer3: "8 feet 2 inches", answer4: "7 feet 10 inches", correct : "8 feet 11 inches"),
    testForm(question: "How many licks does it take to get to the center of a Tootsie Pop?", answer1: "59-127", answer2: "831-1142", answer3: "1200-1500", answer4: "252-411", correct : "252-411"),
    testForm(question: "Which of the following is south of Detroit?", answer1: "Canada", answer2: "Paris", answer3: "Ireland", answer4: "Alaska", correct : "Canada"),
    testForm(question: "What was the original name of Google?", answer1: "Find it", answer2: "Easy Search", answer3: "Backrub", answer4: "Soap box", correct : "Backrub"),
]
