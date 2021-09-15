//
//  HomeView.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

import SwiftUI
import Foundation

struct HomeView: View {
    @State var isShow = false
    @State var code = ""
    //@StateObject var settings = Team()
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    let swiftColor = UIColor(red: 181/255, green: 24/255, blue: 24/255, alpha: 1)
    var body: some View {
        ZStack {
            Color(swiftColor)
                .ignoresSafeArea(edges: .top)
            VStack{
                //Spacer()
                BurgerView()
                    //.frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                Spacer()
                LogoView()
                    .offset(y: 55)
                Text("Kenny's Burger Joint")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .offset( y: 40)
                Text("Plano & Frisco")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                    .offset( y: 40)
                Spacer()
                
                Spacer()
                
                InfoView(text: "(972) 378-0999", imageName: "phone.fill", location: "Plano")
                InfoView(text: "(214) 618-8001", imageName: "phone.fill", location: "Frisco")
                LinkView(text: "kennysburgerjoint.com", imageName: "globe")
                    .padding(.bottom)
                
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        //firstLaunch = false
                    }, label: {
//                        Image(systemName: "person.fill")
//                            .foregroundColor(.white)
//                            .font(.title)
                    })
                    .padding(50)
                    .ignoresSafeArea()
                    .popover(isPresented: $firstLaunch, content: {
                        VStack {
                            Text("Welcome to the \nKenny's App")
                                .bold()
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .padding(40)
                            
                            ListView(title: "View the Menu", description: "Have quick access to all our burgers and specials.", image: "wallet.pass.fill")
                                .padding(.leading)
                                .padding(.trailing)
                            ListView(title: "See our deals and promos", description: "Use our 'What's Cookin Screen' and notifications to access our latest deals!", image: "bell.badge.fill")
                                .padding(.leading)
                                .padding(.trailing)
                            ListView(title: "Check the Special", description: "Look at the menu screen to see the latest special. We'll send you a notification when we launch a new one.", image: "sparkles")
                                .padding(.leading)
                                .padding(.trailing)
                            Spacer()
                            Button(action: {
                                firstLaunch = false
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.blue)
                                        .frame(width: 300, height: 45, alignment: .center)
                                    Text("Continue")
                                        .foregroundColor(.white)
                                }
                            })
                            .padding(.bottom, 60)
                        }
                    })
                }
                Spacer()
            }
            //            if isShow == true {
            //                ZStack {
            //                    RoundedRectangle(cornerRadius: 25)
            //                        .frame(width: 300, height: 200, alignment: .center)
            //                        .foregroundColor(.gray)
            //                        .opacity(0.8)
            //                    VStack {
            //                        Text("Employee Code:")
            //                            .foregroundColor(.white)
            //                            .font(.title)
            //                        TextField("Your code", text: $code)
            //                            .textContentType(.oneTimeCode)
            //                                .keyboardType(.numberPad)
            //                            .frame(width: 275, height: 30, alignment: .center)
            //                            .multilineTextAlignment(.center)
            //                            .font(.subheadline)
            //                        Button(action: {
            //                            let eq = code == "58008"
            //                            if eq == true {
            //                                settings.newShow = true
            //                                code = "12345"
            //                            }
            //                           code = ""
            //                            isShow = false
            //                        }, label: {
            //                            Text("Enter")
            //                                .foregroundColor(.white)
            //                        })
            //                    }
            //                }
            //            }
        }
        //.environmentObject(settings)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
struct InfoView: View {
    
    let text: String
    let imageName: String
    let location: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(Color.white)
            .frame( height: 50)
            .overlay(HStack {
                Text(location + ":")
                    .foregroundColor(Color.newRed)
                    .padding()
                Image(systemName: imageName)
                    .foregroundColor(Color.newRed)
                Text(text)
                    .foregroundColor(Color.newRed)
                    .padding(.trailing)
            })
            .padding()
            .frame(maxWidth: 350)
    }
}
struct LinkView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        Link(destination: URL(string: "https://kennysburgerjoint.com")!,
             label: {
                HStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white)
                        .frame( height: 50)
                        .overlay(HStack {
                            Image(systemName: imageName)
                                .foregroundColor(Color.newRed)
                            Text(text)
                                .foregroundColor(Color.newRed)
                        })
                        .padding()
                        .frame(maxWidth: 350)
                }
             })
    }
}

struct LogoView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
            .clipShape(Circle())
            .overlay(Circle()
                        .stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
            .offset(y: -140)
            .padding(.bottom, -120)
    }
}



struct BurgerView: View {
    var body: some View {
        Image("royal")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .frame(height: .infinity)
            .edgesIgnoringSafeArea(.all)
            //            .clipShape(Circle())
            //            .overlay(Circle()
            //                        .stroke(Color.white, lineWidth: 4))
            //            .shadow(radius: 7)
            //            .offset(y: -140)
            .padding(.bottom, -170)
    }
}
struct CustomColor {
    static let myColor = Color("kbjColor")
    // Add more here...
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
extension UIColor {
    static let newRed = Color(red: 181, green: 24, blue: 24)
}
extension Color {
    static let newRed = Color(red: 181/256, green: 24/256, blue: 24/256)
}
struct ListView: View {
    
    let title: String
    let description: String
    let image: String
    
    var body: some View {
        HStack{
            HStack {
                Image(systemName: image)
                    .foregroundColor(.blue)
                    .font(.system(size: 35))
                    .padding(.trailing, 20)
                    .frame(width: 60, height: 70, alignment: .leading)
            }
            
            VStack {
                HStack {
                    Text(title)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text(description)
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
            }
        }
        .padding(.bottom)
    }
}

