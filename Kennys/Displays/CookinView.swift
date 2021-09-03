//
//  CookinView.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

import SwiftUI

struct CookinView: View {
    
    var body: some View {
        NavigationView{
            List{
                dealCell(image: "ourburgers")
                dealCell(image: "martinimonday")
                dealCell(image: "ribs")
                dealCell(image: "happyhour")
                dealCell(image: "burgerbar")
                dealCell(image: "burgerkit")
                dealCell(image: "monthlyspecial")
                dealCell(image: "stayposted")
            }
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            .listStyle(SidebarListStyle())
            
            .navigationBarTitle("What's Cooking?")
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
            RoundedRectangle(cornerRadius: 25.0)
//                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.newRed]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 155)
                .overlay(HStack {
                    ZStack {
                        Image(image)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .frame(width: 300, height: 155, alignment: .center)
                        
                    }
                })
                .padding()
                .frame(maxWidth: 550)
        }
    }
}

