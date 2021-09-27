//
//  ScoreView.swift
//  Kennys
//
//  Created by Nick Morris on 9/27/21.
//

import SwiftUI

struct ScoreView: View {
    let firstName : String
    let lastName: String
    let code: String
    let report: String
    var body: some View {
        VStack {
            HStack {
                Text(firstName)
                    .padding()
                Spacer()
            }
            HStack {
                Text(lastName)
                    .padding()
                Spacer()
            }
            HStack {
                Text("Code: " + code)
                    .padding()
                Spacer()
            }
            ScrollView {
                Text(report)
                    .padding()
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(firstName: "Bob", lastName: "Dillan", code: "6969", report: "100%")
    }
}
