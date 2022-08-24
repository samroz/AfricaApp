//
//  MapView.swift
//  Africa
//
//  Created by Samroz Javed on 30/07/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        let mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.437759)
        
        let zoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: zoomLevel)
        
        return mapRegion
    }()
    
    let locations: [animalLocation] = Bundle.main.decode("locations.json")
    var body: some View {
        //MARK: 1. BASIC MAP
        //Map(coordinateRegion: $region)
        
        //MARK: 2. ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // A. PIN: OLD STYLE (always static)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            // B. MARKER: NEW STYLE (always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //C. CUSTOM BASIC ANNOTAION (could be interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image(item.image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 50, height: 50, alignment: .center)
//                    .clipShape(Circle())
//            } //: ANNOTATION
            
            //D. CUSTOM ADVANCED ANNOTATION (It could be interactive)
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
            
        }) //: MAP
        
            .overlay(
                HStack(alignment: .center, spacing: 12) {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                    
                    VStack (alignment: .leading, spacing: 3) {
                        HStack {
                            Text("Latitude")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        Divider()
                        
                        HStack {
                            Text("Longitude")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }
                    
                } //: HSTACK
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(
                        Color.black
                            .cornerRadius(12)
                            .opacity(0.6)
                    )
                    .padding()
                ,alignment: .top
            )

    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
