//
//  maps.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/24.
//

import SwiftUI
import MapKit

struct PinItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct Map5View: View {
    @AppStorage("Locationlatitude") var locationlatitude = 35.217502
    @AppStorage("Locationlongitude") var locationlongitude = 136.836714
    @State private var mapType: MKMapType = .standard
    var body: some View {
        VStack{
        Picker("", selection: $mapType)
        {
            Text("Standard").tag(MKMapType.standard)
            Text("航空写真").tag(MKMapType.hybridFlyover)
        }
        .pickerStyle(SegmentedPickerStyle())
        Map4View(latitude: locationlatitude, longitude: locationlongitude)
        }
    }
}



struct Map4View: View {
    @AppStorage("Locationlatitude") var locationlatitude = 35.217502
    @AppStorage("Locationlongitude") var locationlongitude = 136.836714
    @State private var region = MKCoordinateRegion() // 座標領域
    @State private var userTrackingMode: MapUserTrackingMode = .none
    @State private var mapType: MKMapType = .standard
    var coordinate: CLLocationCoordinate2D? // 表示領域の中心位置
    var latitude: Double // 緯度
    var longitude: Double // 経度

    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: .all,
            showsUserLocation: true,
            userTrackingMode: $userTrackingMode,
            annotationItems: [
                PinItem(coordinate: .init(latitude: latitude, longitude: longitude))
            ],
            annotationContent: { item in
                MapMarker(coordinate: item.coordinate)
            })
            .onAppear {
                setRegion(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            }
    }

    // 引数で取得した緯度経度を使って動的に表示領域の中心位置と、縮尺を決める
    private func setRegion(coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate,
                                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }
}
