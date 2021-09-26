//
//  ExpertView.swift
//  Kennys
//
//  Created by Nick Morris on 9/8/21.
//

import SwiftUI

struct ExpertView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var code = ""
    var body: some View {
        VStack {
            Text("Drinks thing")
                .font(.title)
            TextField("First Name", text: $firstName)
                .padding()
            TextField("Last Name", text: $lastName)
                .padding()
            TextField("Clock in code", text: $code)
                .padding()
            Spacer()
            NavigationLink(destination: TestView()) {
                ZStack{
                    Capsule()
                        .frame(width: 220, height: 50, alignment: .center)
                        .foregroundColor(.blue)
                    Text("Start")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ExpertView_Previews: PreviewProvider {
    static var previews: some View {
        ExpertView()
    }
}
