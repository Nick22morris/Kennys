//
//  MapView.swift
//  Kennys
//
//  Created by Nick Morris on 9/3/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //cordinares
    @State private var region = MKCoordinateRegion(
           center: CLLocationCoordinate2D(latitude: 33.06133, longitude: -96.8175),
           span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
       )
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: pointsOfInterest) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
private var pointsOfInterest = [
    AnnotatedItem(name: "Plano", coordinate: .init(latitude: 33.053632, longitude: -96.795217)),
    AnnotatedItem(name: "Frisco", coordinate: .init(latitude: 33.089035, longitude: -96.839788))
    ]

