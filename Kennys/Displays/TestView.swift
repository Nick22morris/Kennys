//
//  TestView.swift
//  Kennys
//
//  Created by Nick Morris on 9/25/21.
//

import SwiftUI

struct TestView: View {
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var count = 0
    @State var question = questions[0].question
    @State var wrong1 = ""
    @State var wrong2 = ""
    @State var wrong3 = ""
    @State var correct = questions[0].right
    @State var answer1 = questions[0].wrong1
    @State var answer2 = questions[0].wrong2
    @State var answer3 = questions[0].wrong3
    @State var answer4 = questions[0].right
    @State var col = Color.white
    
    let waitTime = 1.5
    let butWide: CGFloat = 300.0
    var body: some View {
        VStack {
            Text(question)
                .font(.title)
                .bold()
                .foregroundColor(col)
                .padding(40)
            Spacer()
            Button {
                let isEqual = answer1 == correct
                if isEqual == true {
                    col = Color.green
                    DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                        col = Color.white
                    }
                    self.count += 1
                    let iteration: testForm = questions[count]
                    question = iteration.question
                    wrong1 = iteration.wrong1
                    wrong2 = iteration.wrong2
                    wrong3 = iteration.wrong3
                    correct = iteration.right
                }
                else {
                    col = Color.red
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: butWide, height: 100, alignment: .center)
                    Text(answer1)
                        .foregroundColor(.white)
                }
            }
            .padding()
            Button {
                let isEqual = answer2 == correct
                if isEqual == true {
                    col = Color.green
                    DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                        col = Color.white
                    }
                    self.count += 1
                    let iteration: testForm = questions[count]
                    question = iteration.question
                    wrong1 = iteration.wrong1
                    wrong2 = iteration.wrong2
                    wrong3 = iteration.wrong3
                    correct = iteration.right
                }
                else {
                    col = Color.red
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: butWide, height: 100, alignment: .center)
                    Text(answer2)
                        .foregroundColor(.white)
                }
            }
            .padding()
            Button {
                let isEqual = answer3 == correct
                if isEqual == true {
                    col = Color.green
                    DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                        col = Color.white
                    }
                    self.count += 1
                    let iteration: testForm = questions[count]
                    question = iteration.question
                    wrong1 = iteration.wrong1
                    wrong2 = iteration.wrong2
                    wrong3 = iteration.wrong3
                    correct = iteration.right
                }
                else {
                    col = Color.red
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: butWide, height: 100, alignment: .center)
                    Text(answer3)
                        .foregroundColor(.white)
                }
            }
            .padding()
            Button {
                let isEqual = answer4 == correct
                if isEqual == true {
                    col = Color.green
                    DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                        col = Color.white
                    }
                    self.count += 1
                    let iteration: testForm = questions[count]
                    question = iteration.question
                    wrong1 = iteration.wrong1
                    wrong2 = iteration.wrong2
                    wrong3 = iteration.wrong3
                    correct = iteration.right
                }
                else {
                    col = Color.red
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: butWide, height: 100, alignment: .center)
                    Text(answer4)
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
        .padding()
        Spacer()
    }
    func cycle() {
        count += 1
        let newSet = questions[count]
        question = newSet.question
        answer1 = newSet.wrong1
        answer2 = newSet.wrong2
        answer3 = newSet.wrong3
        answer4 = newSet.right
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().preferredColorScheme(.dark)
    }
}

