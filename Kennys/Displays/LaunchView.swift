////
////  LaunchView.swift
////  Kennys
////
////  Created by Nick Morris on 9/14/21.
////
//
//import SwiftUI
//
//struct LaunchView: View {
//    var body: some View {
//        VStack {
//            Text("Welcome to the \nKenny's App")
//                .bold()
//                .font(.title)
//                .multilineTextAlignment(.center)
//                .padding(40)
//            
//            ListView(title: "View the Menu", description: "Have quick access to all our burgers and specials", image: "hand.point.up.left.fill")
//                .padding(.leading)
//                    .padding(.trailing)
//            ListView(title: "See our deals and promos", description: "Use our 'What's Cookin Screen' and notifications to access our latest deals!", image: "dollarsign.square.fill")
//                .padding(.leading)
//                .padding(.trailing)
//            ListView(title: "Check the Special", description: "Look at the menu screen to see the latest special. We'll send you a notification when we launch a new onpe", image: "eye.fill")
//                .padding(.leading)
//                .padding(.trailing)
//            Spacer()
//            NavigationLink(
//                destination: HomeView(),
//                label: {
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 25.0)
//                            .foregroundColor(.blue)
//                            .frame(width: 300, height: 45, alignment: .center)
//                        Text("Continue")
//                            .foregroundColor(.white)
//                    }
//                })
//                .padding(.bottom, 60)
//        }
//        
//    }
//}
//struct ListView: View {
//    
//    let title: String
//    let description: String
//    let image: String
//    
//    var body: some View {
//        HStack{
//            HStack {
//                Image(systemName: image)
//                    .foregroundColor(.blue)
//                    .font(.system(size: 35))
//                    .padding(.trailing, 20)
//                    .frame(width: 60, height: 70, alignment: .leading)
//            }
//            
//            VStack {
//                HStack {
//                    Text(title)
//                        .bold()
//                    Spacer()
//                }
//                HStack {
//                    Text(description)
//                        .font(.callout)
//                        .foregroundColor(.gray)
//                    
//                    Spacer()
//                }
//            }
//        }
//        .padding(.bottom)
//    }
//}
//struct LaunchView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchView()
//    }
//}
