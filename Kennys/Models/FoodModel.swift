//
//  FoodModel.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

import Foundation
import SwiftUI
var testy = ""
var foodOrdered = [OrderItem]()
struct FoodCellView: View {
    let foodName: String
    let toppings: String
    let image: String
    let price: String
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(foodName)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    Text(toppings)
                        .font(.caption)
                        .frame(alignment: .leading)
                        .foregroundColor(.white)
                    Spacer()
                    
                }
            }
            Text(price)
                .font(.headline)
                .foregroundColor(.white)
            //            Image(image)
            //                .resizable()
            //                .aspectRatio(contentMode: .fill)
            //                .frame(width: 60, height: 60, alignment: .leading)
        }
    }
}
struct FriesRow: View {
    let fry: String
    let price: String
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(fry)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            Text(price)
                .font(.headline)
                .foregroundColor(.white)
            //            Image("fries")
            //                .resizable()
            //                .aspectRatio(contentMode: .fill)
            //                .frame(width: 60, height: 60, alignment: .leading)
        }
    }
}
struct FoodCell {
    let foodName: String
    let toppings: String
    let image: String
    let price: String
    let type: String
}
struct OrderItem: Identifiable {
    let item: FoodCell
    let temp: String
    let cheese: String
    let modifications: String
    let id = UUID()
}
struct SimpleOrder: Identifiable {
    let name: String
    let temp: String
    let special: String
    let id = UUID()
}
struct Order {
    var foodName: String
    let price: String
    let place: Int
    let type: String
    var cooked = 0
    mutating func cookUp() {
        if cooked < 5 {
            cooked += 1
        } else {
            cooked = 0
        }
        
    }
}
let foodBurgers = [
    FoodCell(foodName: "Zed's Straight Up", toppings: "Lettuce, Tomato, Onion, Pickle, Mayo", image: "zeds", price: "$7.99", type: "Burger"),
    FoodCell(foodName: "Royal w/ Cheese", toppings: "Lettuce, Tomato, Onion, Pickles, Mayo, with your choice of Cheddar, American, Swiss or Pepperjack", image: "royal", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Juicy Lucy", toppings: "Mustard, Ketchup, Onions, Pickles, Stuffed w/ White American", image: "jl", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Patty Melt", toppings: "Sourdough, Sautéed Onions, Swiss, Secret Sauce", image: "patty", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Black & Blue", toppings: "Cajun Spiced, Blue Cheese & Dressing, Lettuce, Tomato, Onion", image: "b&b", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Bacon Cheese", toppings: "Cheddar, Bacon, Lettuce, Tomato, Onion, Pickles, Mayo", image: "baconCheese", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Bud's Queso Burger", toppings: "Bacon, Sautéed Onions, Jalpeños\n*Served Open Faced", image: "quesoBurger", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Mushroom Brie", toppings: "Lettuce, Tomato, Onion, Mayo, Brie", image: "mush", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Bacon & Egg", toppings: "Fried Egg, Bacon, Bearnaise, American", image: "baconEgg", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Turkey Burger", toppings: "Provolone, Basil Pesto Mayo, Balsamic Glaze, Lettuce, Tomato, Onion", image: "turkey", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Southwest Black Bean", toppings: "Queso, Guacamole, Chipotle Ranch, Lettuce, Tomato, Onion", image: "veggie", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "PepperJack Guacamole", toppings: "Bacon, Lettuce, Tomato, Onion, Mayo, House Made Guac", image: "guac", price: "$9.99", type: "Burger"),
    FoodCell(foodName: "Smoke House BBQ", toppings: "Brisket, Bacon, Cheddar, BBQ Sauce, Jalapeños, Onion, Pickles, Mayo", image: "smoke", price: "$11.99", type: "Burger"),
]
let foodSandwiches =
    [FoodCell(foodName: "Southern Fried Chicken", toppings: "Chipotle Ranch, Lettuce, Pickles", image: "chicken", price: "$8.99", type: "Sandwich"),
     FoodCell(foodName: "Smoked Brisket Grilled Cheese", toppings: "Sourdough, Cheddar, Pepperjack, White American", image: "brisket", price: "$9.99", type: "Sandwich"),
     FoodCell(foodName: "Steak Bomb", toppings: "Hoagie, Shaved Ribeye, Mushrooms, Onions, Peppers, White American, Provolone", image: "steak", price: "$10.99", type: "Sandwich"),
     FoodCell(foodName: "Tuna Steak", toppings: "Cajun Spiced, Bacon, Wasabi Mayo, Lettuce, Tomato, Onion", image: "tuna", price: "$11.99", type: "Sandwich")
    ]
let foodSalads = [
    FoodCell(foodName: "Greek", toppings: "Greens, Feta, Kalamata Olives, Cucumber, Tomato, Red Onions, Pepperoncinis, Greek Dressing. Add Chicken ($3.99), Ahi Tuna ($6.99) or a Burger patty ($3.99)", image: "greek", price: "$7.99", type: "Salad"),
    FoodCell(foodName: "Blue Cheese", toppings: "Iceberg, Tomato, Onion, Bacon, Blue Cheese Dressing. Add Chicken ($3.99), Ahi Tuna ($6.99) or a Burger patty ($3.99)", image: "blueCheese", price: "$7.99", type: "Salad"),
    FoodCell(foodName: "Asian", toppings: "Greens, Cucumber, Tomato, Avocado, Mango, Carrots, Red Onion, Toasted Cashews, Won Tons, Sesame Ginger Vinaigrette. Add Chicken ($3.99), Ahi Tuna ($6.99) or a Burger patty ($3.99)", image: "asian", price: "$7.99", type: "Salad")
]
let foodApps = [
    FoodCell(foodName: "Cheese Fries", toppings: "Cheddar, Jalapeños, Bacon, Chives, Ranch", image: "cheeseFries", price: "$8.99", type: "Appetizer"),
    FoodCell(foodName: "Chips & Queso", toppings: "Bud's White Queso, Tortilla Chips", image: "queso", price: "$5.99", type: "Appetizer"),
    FoodCell(foodName: "Fried Pickles", toppings: "Served with Ranch", image: "pickles", price: "$6.99", type: "Appetizer"),
    FoodCell(foodName: "Onion Rings", toppings: "House Battered & Fried", image: "onionRings", price: "$6.99", type: "Appetizer"),
    FoodCell(foodName: "Stuffed Jalapeños", toppings: "Stuffed with Pepperjack. Served with BBQ & Ranch", image: "japs", price: "$7.99", type: "Appetizer"),
    FoodCell(foodName: "Coleslaw",toppings: "A Classic!", image: "coleslaw", price: "$2.49", type: "Appetizer"),
    FoodCell(foodName: "Regular Fries", toppings: "", image: "fries", price: "$2.49", type: "Fry"),
    FoodCell(foodName: "Sweet Potato Fries", toppings: "", image: "sweet", price: "$3.49", type: "Fry"),
    FoodCell(foodName: "Truffle Parmesan Fries",toppings: "", image: "truffle", price: "$3.49", type: "Fry"),
    FoodCell(foodName: "Tater Tots", toppings: "", image: "tots", price: "$3.49", type: "Side")
]

