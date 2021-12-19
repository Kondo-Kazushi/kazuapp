//
//  SwiftUIView.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/21.
//

import SwiftUI
import MapKit
import CoreLocation

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

struct MapView: View {
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.217502, longitude: 136.836714),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    

    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


struct MapView2: View {
    @State private var region = MKCoordinateRegion(center: .init(latitude: 35.217502, longitude: 136.836714),
                                                   latitudinalMeters: 2300, longitudinalMeters:2300)
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    struct PinItem: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    
    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: .zoom,
            showsUserLocation: true,
            userTrackingMode: $userTrackingMode,
            annotationItems: [
                PinItem(coordinate: .init(latitude: 35.217502, longitude: 136.836714))
            ],
            annotationContent: { item in
                MapMarker(coordinate: item.coordinate)
            }
        ).edgesIgnoringSafeArea(.all)
    }
}
struct MapView2_Previews: PreviewProvider {
    static var previews: some View {
        MapView2()
    }
}

struct MapView3: View {
    @State private var region = MKCoordinateRegion(center: .init(latitude: 35.217502, longitude: 136.836714),
                                                   latitudinalMeters: 2300, longitudinalMeters:2300)
        
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    struct PinItem: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    
    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: .zoom,
            showsUserLocation: true,
            userTrackingMode: $userTrackingMode,
            annotationItems: [
                PinItem(coordinate: .init(latitude: 35.217502, longitude: 136.836714))
            ],
            annotationContent: { item in
                MapMarker(coordinate: item.coordinate)
            }
        ).edgesIgnoringSafeArea(.all)
    }
}
struct MapView3_Previews: PreviewProvider {
    static var previews: some View {
        MapView3()
    }
}

struct MapViewUIKit: UIViewRepresentable {
    // 1.
    let region: MKCoordinateRegion
    let mapType : MKMapType
    
    // 2.
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: false)
        mapView.mapType = mapType
        return mapView
    }
    
    // 3.
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType
    }
}
