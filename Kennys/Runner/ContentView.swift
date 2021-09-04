//
//  ContentView.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

import SwiftUI
import Firebase
struct ContentView: View {
   
    @State private var selection = 0
    @State var show = false
    @State var tag1 = 0
    @State var tag2 = 1
    @State var tag3 = 4
    @State var tag4 = 2
    @State var tag5 = 3
    let db = Firestore.firestore()
    @State var model = ToggleModel()
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .environment(\.colorScheme, .dark)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                        //.foregroundColor(.black)
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
                                                show = remote
                                            }
                                        }
                                    }
                                }
                            }
                            if show == true {
                                tag1 = 0
                                tag2 = 1
                                tag3 = 2
                                tag4 = 3
                            }
                        }
                }
                .preferredColorScheme(.dark)
                .tag(tag1)
            MenuView()
                .environment(\.colorScheme, .dark)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                    //.foregroundColor(.black)
                }
                .tag(tag2)
            if show == true {
                
                OrderView()
                    .environment(\.colorScheme, .dark)
                    .tabItem {
                        Label("Order", systemImage: "cart.fill")
                        //.foregroundColor(.black)
                    }
                    .tag(tag3)
            }
//            CrewView()
//                .tabItem {
//                    Label("Crew", systemImage: "person.fill")
//                    //.foregroundColor(.black)
//                }
//                .tag(tag4)
//
            CookinView()
                .environment(\.colorScheme, .dark)
                .tabItem {
                    Label("What’s Cooking?", systemImage: "dollarsign.square.fill")
                    //.foregroundColor(.black)
                }
                .tag(tag4)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.preferredColorScheme(.dark)
    }
}
struct ToggleModel {
    var isDark: Bool = true {
        didSet {
            SceneDelegate.shared?.window!.overrideUserInterfaceStyle = isDark ? .dark : .dark
        }
    }
}
