//
//  SecondView.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/21.
//

import SwiftUI
import MapKit

struct SecondView: View {
    @AppStorage("Locationlatitude") var locationlatitude = 35.217502
    @AppStorage("Locationlongitude") var locationlongitude = 136.836714
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.217502, longitude: 136.836714), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var mapType: MKMapType = .standard
        
    var body: some View {
        VStack {
            Picker("", selection: $mapType)
            {
                Text("Standard").tag(MKMapType.standard)
                Text("航空写真").tag(MKMapType.hybridFlyover)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .font(.largeTitle)
            MapViewUIKit(region: region, mapType: mapType)
                
            }
        }
    }

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
