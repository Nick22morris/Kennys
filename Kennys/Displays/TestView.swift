//
//  TestView.swift
//  Kennys
//
//  Created by Nick Morris on 9/25/21.
//

import SwiftUI
import Firebase

struct TestView: View {
    let db = Firestore.firestore()
    
    let firstName: String
    let lastName: String
    let clock: String
    
    
    
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var count = 0
    @State var amountRight = 0
    @State var publishText = ""
    @State var question = questions[0].question
    @State var wrong1 = ""
    @State var wrong2 = ""
    @State var wrong3 = ""
    @State var correct = questions[0].correct
    @State var answer1 = questions[0].answer1
    @State var answer2 = questions[0].answer2
    @State var answer3 = questions[0].answer3
    @State var answer4 = questions[0].answer4
    @State var col = Color.white
    @State var isPlaying = true
    let waitTime = 1.5
    let butWide: CGFloat = 300.0
    let butHigh: CGFloat = 75.0
    let max = questions.count
    var body: some View {
            VStack {
                if isPlaying == true {
                    Text(question)
                        .font(.title)
                        .bold()
                        .foregroundColor(col)
                        .lineLimit(nil)
                        .frame(width: 375, height: 160, alignment: .center)
                    Button {
                        let isEqual = answer1 == correct
                        cycle(passed: isEqual, select: answer1)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: butWide, height: butHigh, alignment: .center)
                            Text(answer1)
                                .foregroundColor(.white)
                        }
                    }
                    Button {
                        let isEqual = answer2 == correct
                        cycle(passed: isEqual, select: answer2)
                    }
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: butWide, height: butHigh, alignment: .center)
                        Text(answer2)
                            .foregroundColor(.white)
                    }
                }
                    Button {
                        let isEqual = answer3 == correct
                        cycle(passed: isEqual, select: answer3)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: butWide, height: butHigh, alignment: .center)
                            Text(answer3)
                                .foregroundColor(.white)
                        }
                    }
                    Button {
                        let isEqual = answer4 == correct
                        cycle(passed: isEqual, select: answer4)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: butWide, height: butHigh, alignment: .center)
                            Text(answer4)
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                } else {
                    NavigationLink(destination: ResultView(score: publishText), label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: butWide, height: butHigh, alignment: .center)
                            Text("View Score")
                                .foregroundColor(.white)
                        }
                    })
                }
                
            }
            .navigationBarHidden(true)    }
    func cycle(passed: Bool, select: String) {
        if passed == true {
            withAnimation(.easeIn) {
                col = Color.green
            }
            amountRight += 1
            
        }
        else {
            col = Color.red
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
            col = Color.white
        }
        if (count + 1) == max {
            publishText.append("Question: " + question + "\n")
            publishText.append("Your Answer: " + select + "\n")
            publishText.append("Right Answer: " + correct + "\n\n")
            withAnimation(.easeIn) {
                publishText.append("\n\nScore: " + String(amountRight)+"/"+String(max))
                publishText.append("\n\nGrade: " + String((Float(amountRight)/Float(max))*100) + "%")
                submitScores(first: firstName, last: lastName, code: clock, report: publishText)
                isPlaying = false
                question = "Done"
                answer1 = "YOU"
                answer2 = "TOTALLY"
                answer3 = "NAILED"
                answer4 = "IT"
                correct = "YOU"
            }
            
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                count += 1
                publishText.append("Question: " + question + "\n")
                publishText.append("Your Answer: " + select + "\n")
                publishText.append("Right Answer: " + correct + "\n\n")
                let newSet = questions[count]
                withAnimation(.easeIn) {
                    question = newSet.question
                    answer1 = newSet.answer1
                    answer2 = newSet.answer2
                    answer3 = newSet.answer3
                    answer4 = newSet.answer4
                    correct = newSet.correct
                }
                
            }
            
        }
        
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(firstName: "John", lastName: "Cena", clock: "6969").preferredColorScheme(.dark)
    }
}
func submitScores(first: String, last: String, code: String, report: String) {
    let t = Date().timeIntervalSince1970
    db.collection("a-scores").addDocument(data: [
        "first" : first,
        "last" : last,
        "code" : code,
        "report" : report,
        "time" : t
    ])
}
