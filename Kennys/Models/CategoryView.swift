//
//  CategoryView.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

import SwiftUI

struct CategoryItem: View {
    var food: FoodCell

    var body: some View {
        VStack(alignment: .leading) {
            Image(food.image)
                .data(url: URL(string: food.image)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(5)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(food.foodName)
                .font(.caption)
                .foregroundColor(.primary)
                .frame(maxWidth: 100, alignment: .leading)
        }
        .padding(.leading, 15)
    }
}

struct SpecialItem: View {
    var food: FoodCell

    var body: some View {
        VStack(alignment: .leading) {
            Image(food.image)
                .data(url: URL(string: food.image)!)
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 200)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(food.foodName)
                .font(.title)
                .padding(.leading)
                .foregroundColor(.primary)
        }
        .padding(.leading, 15)
    }
}


struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(food: FoodCell(foodName: "Nick", toppings: "yunny", image: "Burger", price: "String", type: "Burger"))
    }
}
extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self.resizable()
    }
}
