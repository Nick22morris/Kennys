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
        List {
            ForEach(people, id: \.code) { sco in
                Text(sco.firstName)
                
            }
            
        }
        .onAppear {
            db.collection("a-scores").addSnapshotListener {
                querySnapshot, error in
                if let e = error {
                    people = [reportForm(firstName: "Error Fetching Server", lastName: "Error Fetching Server", code: "Error Fetching Server", report: "Error Fetching Server")]
                    print(e)
                } else {
                    
                    //staff = ["found documents"]
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

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
