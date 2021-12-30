//
//  ContentView.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

import SwiftUI
import Firebase

class Team: ObservableObject {
    @Published var newShow = false
}

struct ContentView: View {
    @State private var selection = 0
    @State var show = false
    @State var tag1 = 0
    @State var tag2 = 1
    @State var tag3 = 4
    @State var tag4 = 2
    @State var tag5 = 3
    @State var tag6 = 4
    @State var msg1 = "The Kenny's Burger Joint app has been deactivated"
    @State var msg2 = "There are currently no plans for reactivation"
    
    
    //@EnvironmentObject var settings: Team
    //@Published var addScreen = false
    let db = Firestore.firestore()
    @State var model = ToggleModel()
    var body: some View {
//        VStack {
//            Spacer()
//            Text(msg1)
//                .multilineTextAlignment(.center)
//                .font(.title)
//                .onAppear {
//                    let ref = db.collection("message")
//                    ref.addSnapshotListener{
//                        querySnapshot, error in
//                        if let e = error {
//                            msg1 = "The Kenny's Burger Joint app has been deactivated"
//                            print(e)
//                        } else {
//                            if let snapshotDocuments = querySnapshot?.documents {
//                                for doc in snapshotDocuments {
//                                    let data = doc.data()
//                                    if let sub = data["sub"] as? String,
//                                       let title = data["title"] as? String {
//                                        //let count = staff.count
//                                        msg1 = title
//                                        msg2 = sub
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            Spacer()
//            Text(msg2)
//                .italic()
//                .multilineTextAlignment(.center)
//            Spacer()
//        }
        
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
                                        tag6 = 4
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
        //            if settings.newShow == true {
        //                ExpertView()
        //                    .environment(\.colorScheme, .dark)
        //                    .tabItem {
        //                        Label("Staff", systemImage: "person.fill")
        //                    }
        //                    .tag(tag6)
        //            }
        
                    //.foregroundColor(.black)
                }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.environmentObject(Team())//.preferredColorScheme(.dark)
    }
}
struct ToggleModel {
    var isDark: Bool = true {
        didSet {
            SceneDelegate.shared?.window!.overrideUserInterfaceStyle = isDark ? .dark : .dark
        }
    }
}
