//
//  FoodViewClip.swift
//  kennyClip
//
//  Created by Other user on 9/6/21.
//

import SwiftUI

struct FoodViewClip: View {
    @State var cookTemp = ""
    let name: String
    let type: String
    let description: String
    let price: String
    let image: String
    let buttonHeight: CGFloat = 35
    let buttonWidth: CGFloat = 120
    let buttonWidthCheese: CGFloat = 150
    let item : FoodCell
    @State var isBurger = false
    @State var cheese = "NA"
    @State var isRoyal = false
    @State var click2 = false
    @State var extra = ""
    @State var salad = false
    
    @State var isAccepting = false
    
    @State var timeRemaining = 0
    @State var isShowing = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var clicked = false
    var body: some View {
        ZStack {
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        ItemView(pic: image)
                        Spacer()
                    }
                    Text(name)
                        .font(.title)
                        .padding(.leading)
                    
                    HStack {
//                        Text(type)
//                            .padding(.leading)
                        Spacer()
                        Text(price)
                            .padding(.trailing)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("Description")
                        .bold()
                        .padding(.leading)
                        .font(.title)
                        .onAppear(perform: {
                            let burgDet = type == "Burger"
                            if burgDet == true {
                                clicked = false
                                isBurger = true
                            } else {
                                clicked = true
                                cookTemp = "NA"
                            }
                            let cheeseDet = name == "Royal w/ Cheese"
                            if cheeseDet == true {
                                isRoyal = true
                            } else {
                                click2 = true
                                cookTemp = "NA"
                            }
                            let saladDet = type == "Salad"
                            if saladDet == true {
                                salad = true
                            }
                        })
                        Text(description)
                            .italic()
                            //.font(.headline)
                            .padding(.leading)
                            .frame(width: 400, height: 50, alignment: .leading)  // <--- here
                                        .allowsTightening(true)
                                        .lineLimit(4)
                                        .scaledToFit()
                                        .minimumScaleFactor(0.7)
                    
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct FoodViewClip_Previews: PreviewProvider {
    static var previews: some View {
        FoodViewClip(name: "Burger", type: "Hotdog", description: "Very yummy", price: "$100", image: "burger", item: FoodCell(foodName: "Burger", toppings: "Hotdog", image: "burger", price: "$100", type: "burger"))
    }
}
struct ItemView: View {
    let pic : String
    var body: some View {
        Image(pic)
            .data(url: URL(string: pic)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 350, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .overlay(RoundedRectangle(cornerRadius: 20.0)
                        .stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
            .shadow(radius: 7)
    }
}
