//
//  ContentView.swift
//  kennyClip
//
//  Created by Other user on 9/6/21.
//

import SwiftUI

struct ContentView: View {
    @State var urlFire = "https://i.ytimg.com/vi/lcQvkhNXoNU/maxresdefault.jpg"
    @State var name = ""
    @State var type = ""
    @State var description = ""
    @State var price = ""
    @State var specialArray = [FoodCell]()
    var body: some View {
        NavigationView {
            let frameHeight: CGFloat = 135.0
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
//                    HStack {
//                        Text("Monthly Special")
//                            .font(.headline)
//                            .padding(.leading, 15)
//                            .padding(.top, 5)
//                        Spacer()
//                    }
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(alignment: .top, spacing: 0) {
//                            ForEach(specialArray, id: \.foodName) { food in
//                                NavigationLink(destination: FoodView(name: food.foodName, type: food.type, description: food.toppings, price: food.price, image: food.image, item: food)) {
//                                    SpecialItem(food: food)
//                                }
//                            }
//                        }
//                    }
//                    Text("")
//                        .onAppear() {
//                            db.collection("z-special").addSnapshotListener {
//                                querySnapshot, error in
//                                if let e = error {
//                                    name = "error fetching server"
//                                    print(e)
//                                } else {
//                                    specialArray = []
//                                    //staff = ["found documents"]
//                                    if let snapshotDocuments = querySnapshot?.documents {
//                                        //staff = ["got inside"]
//                                        for doc in snapshotDocuments {
//                                            let data = doc.data()
//                                            if let n = data["name"] as? String,
//                                               let d = data["description"] as? String,
//                                               let i = data["image"] as? String,
//                                               let p = data["price"] as? String,
//                                               let t = data["type"] as? String {
//                                                specialArray.append(FoodCell(foodName: n, toppings: d, image: i, price: p, type: t))
//                                                urlFire = i
//                                                name = n
//                                                type = t
//                                                description = d
//                                                price = p
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    Divider()
                    VStack(alignment: .leading) {
                        Text("Appetizers, Sides, Fries")
                            .font(.headline)
                            .padding(.leading, 15)
                            .padding(.top, 5)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 5) {
                                ForEach(foodApps, id: \.foodName) { food in
                                    NavigationLink(destination: FoodViewClip(name: food.foodName, type: food.type, description: food.toppings, price: food.price, image: food.image, item: food)) {
                                        CategoryItem(food: food)
                                    }
                                }
                            }
                        }
                        .frame(height: frameHeight)
                        
                        Text("Burgers")
                            .font(.headline)
                            .padding(.leading, 15)
                            .padding(.top, 5)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 5) {
                                ForEach(foodBurgers, id: \.foodName) { food in
                                    NavigationLink(destination: FoodViewClip(name: food.foodName, type: food.type, description: food.toppings, price: food.price, image: food.image, item: food)) {
                                        CategoryItem(food: food)
                                    }
                                }
                            }
                        }
                        .frame(height: frameHeight)
                        
                        Text("Sandwiches")
                            .font(.headline)
                            .padding(.leading, 15)
                            .padding(.top, 5)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 5) {
                                ForEach(foodSandwiches, id: \.foodName) { food in
                                    NavigationLink(destination: FoodViewClip(name: food.foodName, type: food.type, description: food.toppings, price: food.price, image: food.image, item: FoodCell(foodName: food.foodName, toppings: food.toppings, image: food.image, price: food.price, type: food.type))) {
                                        CategoryItem(food: food)
                                    }
                                }
                            }
                        }
                        .frame(height: frameHeight)
                        
                        Text("Salads")
                            .font(.headline)
                            .padding(.leading, 15)
                            .padding(.top, 5)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 5) {
                                ForEach(foodSalads, id: \.foodName) { food in
                                    NavigationLink(destination: FoodViewClip(name: food.foodName, type: food.type, description: food.toppings, price: food.price, image: food.image, item: FoodCell(foodName: food.foodName, toppings: food.toppings, image: food.image, price: food.price, type: food.type))) {
                                        CategoryItem(food: food)
                                    }
                                }
                            }
                        }
                        .frame(height: frameHeight)
                        
                    }
                }
                .navigationBarTitle("Menu")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        //List Menu
        //        NavigationView {
        //            List(foodItemList, id: \.foodName) { food in
        //                HStack {
        //                    VStack {
        //                        HStack {
        //                            Text(food.foodName)
        //                                .font(.title)
        //                                .bold()
        //                            Spacer()
        //                        }
        //                        HStack {
        //                            Text(food.toppings)
        //                                .font(.caption)
        //                                .frame(alignment: .leading)
        //                            Spacer()
        //
        //                        }
        //                    }
        //                    Text(food.price)
        //                        .font(.headline)
        //                    //            Image(image)
        //                    //                .resizable()
        //                    //                .aspectRatio(contentMode: .fill)
        //                    //                .frame(width: 60, height: 60, alignment: .leading)
        //                    //                    Button (action:{
        //                    //                        foodOrdered.append(Order(foodName: food.foodName, price: food.price, place: index, type: food.image))
        //                    //                        index+=1
        //                    //                    }) {
        //                    //                        Image(systemName: "plus.square.fill")
        //                    //                    }
        //                }
        //            }
        //            .navigationBarTitle("Menu")
        //        }
        //        .navigationViewStyle(StackNavigationViewStyle())
        //    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
