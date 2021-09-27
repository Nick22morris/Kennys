//
//  ReviewView.swift
//  Kennys
//
//  Created by Nick Morris on 9/27/21.
//

import SwiftUI
import Firebase

struct ReviewView: View {
    @State var people: [reportForm] = []
    let db = Firestore.firestore()
    
    var body: some View {
        VStack {
            Text("Tests")
                .bold()
                .font(.title)
            List {
                ForEach(people, id: \.code) { sco in
                    NavigationLink(destination: ScoreView(firstName: sco.firstName, lastName: sco.lastName, code: sco.code, report: sco.report)) {
                        Text(sco.firstName + " " + sco.lastName)
                    }
                    
                }
                
            }
            .onAppear {
                let ref = db.collection("a-scores")
                ref.order(by: "t")
                ref.addSnapshotListener{
                    querySnapshot, error in
                    if let e = error {
                        people = [reportForm(firstName: "Error Fetching Server", lastName: "Error Fetching Server", code: "Error Fetching Server", report: "Error Fetching Server")]
                        print(e)
                    } else {
                        if let snapshotDocuments = querySnapshot?.documents {
                            //staff = ["got inside"]
                            people = []
                            for doc in snapshotDocuments {
                                let data = doc.data()
                                if let first = data["first"] as? String,
                                   let code = data["code"] as? String,
                                   let last = data["last"] as? String,
                                   let score = data["report"] as? String {
                                    //let count = staff.count
                                    let forma = reportForm(firstName: first, lastName: last, code: code, report: score)
                                    people.append(forma)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
