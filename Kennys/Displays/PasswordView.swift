//
//  PasswordView.swift
//  Kennys
//
//  Created by Nick Morris on 9/25/21.
//

import SwiftUI

struct PasswordView: View {
    @State private var username: String = ""
    @State private var willMoveToNextScreen = false
    @State var showing = false
    @State var manage = false
    @State var checkColor = Color.white
    var body: some View {
        VStack {
            Text("Enter Passcode")
                .padding()
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 250, height: 100, alignment: .center)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(checkColor, lineWidth: 4))
                    .shadow(radius: 7)
                VStack {
                    Text("Enter your employee code")
                    TextField("Username", text: $username)
                        .disableAutocorrection(true)
                        .textContentType(.oneTimeCode)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                    //.background(Color.secondary)
                        .frame(width: 150)
                }
            }
            .padding()
            Button {
                let isEqual = username == "58008"
                let isPro = username == "1134"
                if isEqual == true {
                    checkColor = Color.green
                    showing = true
                    manage = false
                }
                else if isPro == true {
                        checkColor = Color.blue
                        manage = true
                    showing = false
                }
                else {
                    username = ""
                    checkColor = Color.red
                    showing = false
                    manage = false
                }
            } label: {
                ZStack{
                    Capsule()
                        .frame(width: 150, height: 50, alignment: .center)
                        .foregroundColor(.blue)
                    Text("Check")
                        .foregroundColor(.white)
                }
            }
            .padding()
            if showing == true {
                Spacer()
                NavigationLink(destination: ExpertView()) {
                    ZStack{
                        Capsule()
                            .frame(width: 150, height: 50, alignment: .center)
                            .foregroundColor(.blue)
                        Text("Start")
                            .foregroundColor(.white)
                    }
                }
            }
            if manage == true {
                Spacer()
                NavigationLink(destination: ReviewView()) {
                    ZStack{
                        Capsule()
                            .frame(width: 150, height: 50, alignment: .center)
                            .foregroundColor(.blue)
                        Text("Start")
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
            Spacer()
        }
    }
}
struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView()
    }
}
//extension View {
//    /// Navigate to a new view.
//    /// - Parameters:
//    ///   - view: View to navigate to.
//    ///   - binding: Only navigates when this condition is `true`.
//    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
//        NavigationView {
//            ZStack {
//                self
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)
//
//                NavigationLink(
//                    destination: view
//                        .navigationBarTitle("")
//                        .navigationBarHidden(true),
//                    isActive: binding
//                ) {
//                    EmptyView()
//                }
//            }
//        }
//    }
//}
