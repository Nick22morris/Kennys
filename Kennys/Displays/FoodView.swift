//
//  FoodView.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

import SwiftUI

import SwiftUI
import Firebase
struct FoodView: View {
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
    let db = Firestore.firestore()
    
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
                            .onAppear {
                                db.collection("z-accept").addSnapshotListener { querySnapshot, error in
                                    if let e = error {
                                        //
                                        print(e)
                                    } else {
                                        //staff = ["found documents"]
                                        if let snapshotDocuments = querySnapshot?.documents {
                                            //staff = ["got inside"]
                                            for doc in snapshotDocuments {
                                                //staff = ["even farther"]
                                                let data = doc.data()
                                                if let remote = data["today"] as? Bool{
                                                    isAccepting = remote
                                                }
                                            }
                                        }
                                    }
                                }
                            }
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
                
                if isAccepting == true {
                    TextField("Modify", text: $extra)
                        .padding(.leading, 40)
                    Spacer()
                    ScrollView{
                    if salad == true {
                        Text("Add")
                        HStack {
                            Button(action: {
                                extra = "Add Burger"
                                isBurger = true
                                clicked = false
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                        .foregroundColor(.red)
                                    Text("Burger")
                                        .foregroundColor(.white)
                                    
                                }
                            })
                            Button(action: {
                                extra = "Add Tuna"
                                isBurger = true
                                clicked = false
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                        .foregroundColor(.red)
                                    Text("Tuna")
                                        .foregroundColor(.white)
                                    
                                }
                            })
                        }
                        Button(action: {
                            extra = "Add Chicken"
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                    .foregroundColor(.red)
                                Text("Chicken")
                                    .foregroundColor(.white)
                                
                            }
                        })
                    }
                        if isBurger == true {
                            Text("Temperture")
                            HStack {
                                Button(action: {
                                    cookTemp = "Rare"
                                    click()
                                    if isRoyal != true {
                                        click2func()
                                    }
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                            .foregroundColor(.red)
                                        Text("Rare")
                                            .foregroundColor(.white)
                                        
                                    }
                                })
                                Button(action: {
                                    cookTemp = "Medium Rare"
                                    click()
                                    if isRoyal != true {
                                        click2func()
                                    }
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                            .foregroundColor(.red)
                                        Text("Medium Rare")
                                            .foregroundColor(.white)
                                        
                                    }
                                })
                            }
                            HStack {
                                Button(action: {
                                    cookTemp = "Medium"
                                    click()
                                    if isRoyal != true {
                                        click2func()
                                    }
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                            .foregroundColor(.red)
                                        Text("Medium")
                                            .foregroundColor(.white)
                                        
                                    }
                                })
                                Button(action: {
                                    cookTemp = "Medium Well"
                                    click()
                                    if isRoyal != true {
                                        click2func()
                                    }
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                            .foregroundColor(.red)
                                        Text("Medium Well")
                                            .foregroundColor(.white)
                                        
                                    }
                                })
                                Button(action: {
                                    cookTemp = "Well Done"
                                    click()
                                    if isRoyal != true {
                                        click2func()
                                    }
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                            .foregroundColor(.red)
                                        Text("Well Done")
                                            .foregroundColor(.white)
                                        
                                    }
                                })
                            }
                            
                            
                            //Spacer
//                            RoundedRectangle(cornerRadius: 25.0)
//                                .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
//                                .opacity(0.0)
                            //if Royal
                            if click2 == true {
                            if isRoyal == true {
                                Text("Cheese")
                                HStack {
                                        Button(action: {
                                            cheese = "Yellow Cheddar"
                                            click2func()
                                        }, label: {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 25.0)
                                                    .frame(width: buttonWidthCheese, height: buttonHeight, alignment: .center)
                                                    .foregroundColor(.red)
                                                Text("Yellow Cheddar")
                                                    .foregroundColor(.white)
                                                
                                            }
                                        })
                                        Button(action: {
                                            cheese = "Pepper Jack"
                                            click2func()
                                        }, label: {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 25.0)
                                                    .frame(width: buttonWidthCheese, height: buttonHeight, alignment: .center)
                                                    .foregroundColor(.red)
                                                Text("Pepper Jack")
                                                    .foregroundColor(.white)
                                                
                                            }
                                        })
                                }
                                HStack {
                                    Button(action: {
                                        cheese = "White American"
                                        click2func()
                                    }, label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 25.0)
                                                .frame(width: buttonWidthCheese, height: buttonHeight, alignment: .center)
                                                .foregroundColor(.red)
                                            Text("White American")
                                                .foregroundColor(.white)
                                            
                                        }
                                    })
                                    Button(action: {
                                        cheese = "Swiss"
                                        click2func()
                                    }, label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 25.0)
                                                .frame(width: buttonWidthCheese, height: buttonHeight, alignment: .center)
                                                .foregroundColor(.red)
                                            Text("Swiss")
                                                .foregroundColor(.white)
                                            
                                        }
                                    })
                                }
                                    
                                    
                                    //Spacer
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: buttonWidthCheese, height: buttonHeight, alignment: .center)
                                        .opacity(0.0)
                            }
                            }
                        }
                    }
                    
                    
                    
                    if clicked == true {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 300, height: 30, alignment: .center)
                                .luminanceToAlpha()
                            Button(action: {
                                let test = extra == ""
                                if test == true {
                                    extra = "No Modifications"
                                }
                                foodOrdered.append(OrderItem(item: item, temp: cookTemp, cheese: cheese, modifications: extra))
                                timeRemaining = 2
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                    Text("Add to Order")
                                        .foregroundColor(.white)
                                        
                                        .onReceive(timer) { _ in
                                            if timeRemaining > 1 {
                                                toShow()
                                                timeRemaining -= 1
                                            }
                                            else {
                                                showed()
                                                timeRemaining = 0
                                            }
                                        }
                                    
                                }
                                .padding()
                            })
                        }
                    }
                    
                }
                Spacer()
            }
            if isShowing == true {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 200, height: 200, alignment: .center)
                        .foregroundColor(.gray)
                        .opacity(0.7)
                    Text("Added")
                        .font(.title)
                        .bold()
                        
                        .frame(width: 200, height: 200, alignment: .center)
                        .foregroundColor(.primary)
                }
            }
            
        }
    }
    func click() {
        withAnimation{
            click2 = true
        }
    }
    func click2func() {
        withAnimation{
            clicked = true
        }
    }
    func toShow() {
        withAnimation{
            isShowing = true
        }
    }
    func showed() {
        withAnimation{
            isShowing = false
        }
    }
}
struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        let food = FoodCell(
            foodName: "Royal w/ Cheese",
            toppings: "Lettuce, Tomato, Onion, Pickles",
            image: "royal",
            price: "$8.99",
            type: "Salad")
        FoodView(name: food.foodName, type: food.type, description: food.toppings, price: food.price, image: food.image, item: food)
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
