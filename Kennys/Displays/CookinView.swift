//
//  CookinView.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

import SwiftUI

struct CookinView: View {
    @State var isShowingPopover = false
    var body: some View {
        NavigationView{
            ZStack {
                List{
                    dealCell(image: "ourburgers")
                    dealCell(image: "martinimonday")
                    dealCell(image: "ribs")
                    dealCell(image: "happyhour")
                    dealCell(image: "burgerbar")
                    dealCell(image: "burgerkit")
                    dealCell(image: "monthlyspecial")
                    dealCell(image: "stayposted")
                    HStack {
                        Spacer()
                        NavigationLink(destination: PasswordView()) {
                            Text("Employee Info")
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    
                }
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
                }
                .listStyle(SidebarListStyle())
                
                
            .navigationBarTitle("What's Cooking?")
            }
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
    }
        
}

struct CookinView_Previews: PreviewProvider {
    static var previews: some View {
        CookinView()
    }
}

struct dealCell: View {
    
    let image: String
    //let time: String
    
    var body: some View {
        HStack {
            ZStack {
                Image(image)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .overlay(RoundedRectangle(cornerRadius: 25.0)
                                .stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                //.offset(y: -140)
                    .frame(width: 300, height: 155, alignment: .center)
                
            }
            .padding()
        }
    }
}

