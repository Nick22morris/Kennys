//
//  DealsView.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

import SwiftUI

struct DealsView: View {
    @State private var angle: Double = 0
    @State private var zoom: CGFloat = 0
    @State var message = "No connection"
    @State var image = "wifi"
    @State var smaller = "please try again later or connect to wifi"
    var body: some View {
        ZStack {
            Color(.systemRed)
                .ignoresSafeArea(edges: .top)
            VStack {
                Spacer()
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250) //250
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .scaleEffect(zoom)
                    .animation(.easeIn)
                    .onAppear(perform: {
                        retrieveData()
                        if zoom < 1 {
                            angle += 360
                            zoom += 1
                        }
                        
                    })
                    .onDisappear(perform: {
                        zoom = 0
                    })
                    
//                    .rotationEffect(.degrees(angle))
//                    .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 2, initialVelocity: 2))
                Text(message)
                    //.font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .multilineTextAlignment(.center)
                Text(smaller)
                    .foregroundColor(.white)
                    .font(.caption)
                Spacer()
                Spacer()
            }
        }
    }
    func retrieveData() {
            db.collection("deals").getDocuments { querySnapshot, error in
                if let e = error {
                    message = "No connection"
                    print(e)
                } else {
                    //staff = ["found documents"]
                    if let snapshotDocuments = querySnapshot?.documents {
                        //staff = ["got inside"]
                        for doc in snapshotDocuments {
                            //staff = ["even farther"]
                            let data = doc.data()
                            if let message1 = data["deal"] as? String, let image1 = data["image"] as? String, let note = data["message"] as? String{
                                //let count = staff.count
                               message = message1
                                image = image1
                                smaller = note
                            }
                        }
                    }
                }
            }
            //    if staff == []{
            //        staff = ["this error"]
            //    }
        }
    }


struct DealsView_Previews: PreviewProvider {
    static var previews: some View {
        DealsView()
    }
}

