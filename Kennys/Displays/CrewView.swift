//
//  CrewView.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

//
//  CrewView.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import SwiftUI
import Firebase

let date = Date()
let calendar = Calendar.current
let hour = calendar.component(.hour, from: date)
let minutes = calendar.component(.minute, from: date)
let weekDay = Date().dayNumberOfWeek()!
var dayString = getDayOfWeek(input: weekDay)
let documentDay = getDocument(day: weekDay, hour: hour)
let components = date.get(.day, .month, .year)
let day = components.day
let month = components.month
let year = components.year
let newMonth = switchMonth(number: month!)
let topicString = dayString + ", " + newMonth + " " + String(day!)
let db = Firestore.firestore()

struct CrewView: View {
    @State var staff = ["Nick","Nathan", "Emma"]
    @State var jobs = ["Nick","Nathan", "Emma"]
    @State var bodies = [cellShape(name: "Nick", title: "Host")]
    
    @State var staffF = ["Nick","Nathan", "Emma"]
    @State var jobsF = ["Nick","Nathan", "Emma"]
    @State var bodiesF = [cellShape(name: "Nick", title: "Host")]
    @State var num = -1
    @State var hasRun = 1
    var body: some View {
        NavigationView{
            //            VStack {
            //                HStack {
            //                    Text("Plano")
            //                        .font(.title)
            //                        .padding(.leading)
            //                        .onAppear(perform: {
            //                            hasRun += 1
            //                            bodies = []
            //                            staff = []
            //                            jobs = []
            //                            retrieveData()
            //                            retrieveDataFrisco()
            //                            hasRun = 0
            //                        })
            //                    Spacer()
            //                }
            List {
                Section(header: Text("Plano")) {
                    ForEach(bodies, id: \.name) { staf in
                        VStack{
                            HStack {
                                Text(staf.name)
                                    .bold()
                                    .onDisappear(perform: {                                    })
                                    .font(.title)
                                Spacer()
                            }
                            
                            HStack {
                                Text(staf.title)
                                    //.foregroundColor(.white)
                                    .font(.caption)
                                    .frame(alignment: .leading)
                                Spacer()
                            }
                        }
                    }
                }
                Section(header: Text("Frisco")) {
                    ForEach(bodiesF, id: \.name) { staf in
                        VStack{
                            HStack {
                                Text(staf.name)
                                    .bold()
                                    .onDisappear(perform: {                                    })
                                    .font(.title)
                                Spacer()
                            }
                            
                            HStack {
                                Text(staf.title)
                                    //.foregroundColor(.white)
                                    .font(.caption)
                                    .frame(alignment: .leading)
                                Spacer()
                            }
                        }
                    }
                }
                //                List(bodies, id: \.name) { staf in
                //                    Group {
                //                        VStack
                //                    }
                //
                //
                //                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle(topicString)
                .onAppear(perform: {
                hasRun += 1
                bodies = []
                staff = []
                jobs = []
                retrieveData()
                retrieveDataFrisco()
                hasRun = 0
            })
        }
       
        .navigationViewStyle(StackNavigationViewStyle())
        
        
        //    init() {
        //        UITableView.appearance().separatorStyle = .none
        //        UITableViewCell.appearance().backgroundColor = .white
        //        UITableView.appearance().backgroundColor = .white
        //    }
    }
    func retrieveData() {
        staff = []
        jobs = []
        bodies = []
        db.collection(documentDay).addSnapshotListener {
            querySnapshot, error in
            if let e = error {
                staff = ["error fetching server"]
                print(e)
            } else {
                
                //staff = ["found documents"]
                if let snapshotDocuments = querySnapshot?.documents {
                    //staff = ["got inside"]
                    staff = []
                    jobs = []
                    bodies = []
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let person = data["person"] as? String, let job = data["job"] as? String{
                            //let count = staff.count
                            let staffMember = person
                            staff.append(staffMember)
                            jobs.append(job)
                            bodies.append(cellShape(name: staffMember, title: job))
                            num = 1
                        }
                    }
                }
            }
        }
    }
    func retrieveDataFrisco() {
        staffF = []
        jobsF = []
        bodiesF = []
        db.collection("y-"+documentDay+"-Frisco").addSnapshotListener {
            querySnapshot, error in
            if let e = error {
                staff = ["error fetching server"]
                print(e)
            } else {
                
                //staff = ["found documents"]
                if let snapshotDocuments = querySnapshot?.documents {
                    //staff = ["got inside"]
                    staffF = []
                    jobsF = []
                    bodiesF = []
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let person = data["person"] as? String, let job = data["job"] as? String{
                            //let count = staff.count
                            let staffMember = person
                            staffF.append(staffMember)
                            jobs.append(job)
                            bodiesF.append(cellShape(name: staffMember, title: job))
                            num = 1
                        }
                    }
                }
            }
        }
    }
    //    if staff == []{
    //        staff = ["this error"]
    //    }
}
struct CrewView_Previews: PreviewProvider {
    static var previews: some View {
        CrewView()
    }
}
extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
func getDayOfWeek(input: Int) -> String {
    let days = ["Sunday","Monday","Tuesday","Wednesday", "Thursday","Friday", "Saturday"]
    let new = input-1
    return days[new]
}
func getDocument(day: Int, hour: Int) -> String {
    let days = ["sunday","monday","tuesday","wednesday", "thursday","friday", "saturday"]
    var shift = "hello world"
    if hour >= 16 {
        shift = "PM"
    } else {
        shift = "AM"
    }
    return days[day-1] + shift
}

func doSomething() {
    dayString = "hello"
}
struct cellShape {
    let name: String
    let title: String
}
extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
func switchMonth(number : Int) -> String{
    var monthString = ""
    switch number {
    case 1  :
        monthString = "January"
    case 2  :
        monthString = "February"
    case 3  :
        monthString = "March"
    case 4  :
        monthString = "April"
    case 5  :
        monthString = "May"
    case 6  :
        monthString = "June"
    case 7  :
        monthString = "July"
    case 8  :
        monthString = "August"
    case 9  :
        monthString = "September"
    case 10  :
        monthString = "October"
    case 11  :
        monthString = "November"
    case 12  :
        monthString = "December"
    default :
        monthString = "Error"
    }
    return monthString
}
