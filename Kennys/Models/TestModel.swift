//
//  TestModel.swift
//  Kennys
//
//  Created by Nick Morris on 9/25/21.
//

import Foundation

struct testForm {
    let question : String
    let wrong1 : String
    let wrong2: String
    let wrong3: String
    let right: String
}
let questions = [
    testForm(question: "How old are you", wrong1: "100", wrong2: "1", wrong3: "25", right: "669"),
    testForm(question: "How cool are you", wrong1: "100", wrong2: "1", wrong3: "225", right: "69")
]
