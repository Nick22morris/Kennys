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
    let butHigh: CGFloat = 75.0
    let max = questions.count
    var body: some View {
        
        VStack {
            Text(question)
                .font(.title)
                .bold()
                .foregroundColor(col)
                .padding(.top, 40)
                .padding(.bottom, 80)
            Button {
                let isEqual = answer1 == correct
                cycle(passed: isEqual)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: butWide, height: butHigh, alignment: .center)
                    Text(answer1)
                        .foregroundColor(.white)
                }
            }
            .padding()
            Button {
                let isEqual = answer2 == correct
                cycle(passed: isEqual)
            }
        label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: butWide, height: butHigh, alignment: .center)
                Text(answer2)
                    .foregroundColor(.white)
            }
        }
        .padding()
            Button {
                let isEqual = answer3 == correct
                cycle(passed: isEqual)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: butWide, height: butHigh, alignment: .center)
                    Text(answer3)
                        .foregroundColor(.white)
                }
            }
            .padding()
            Button {
                let isEqual = answer4 == correct
                cycle(passed: isEqual)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: butWide, height: butHigh, alignment: .center)
                    Text(answer4)
                        .foregroundColor(.white)
                }
            }
            .padding()
            Spacer()
        }
    }
    func cycle(passed: Bool) {
        if passed == true {
            withAnimation(.easeIn) {
                col = Color.green
            }
            
        }
        else {
            col = Color.red
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
            col = Color.white
        }
        if (count + 1) == max {
            withAnimation(.easeIn) {
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
                let newSet = questions[count]
                withAnimation(.easeIn) {
                    question = newSet.question
                    answer1 = newSet.wrong1
                    answer2 = newSet.wrong2
                    answer3 = newSet.wrong3
                    answer4 = newSet.right
                    correct = newSet.right
                }
               
            }
           
        }
        
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().preferredColorScheme(.dark)
    }
}

