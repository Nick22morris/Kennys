//
//  HomeView.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

import SwiftUI
import Foundation

struct HomeView: View {
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
            
        }
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

