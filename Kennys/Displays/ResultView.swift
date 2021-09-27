//
//  ResultView.swift
//  Kennys
//
//  Created by Nick Morris on 9/26/21.
//

import SwiftUI

struct ResultView: View {
    let score: String
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Results")
                        .font(.title)
                        .bold()
                    Text(score)
                }
                
            }
            .navigationBarHidden(true)
        }
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(score: "100%")
    }
}
