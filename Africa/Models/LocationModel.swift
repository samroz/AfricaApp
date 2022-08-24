//
//  LocationModel.swift
//  Africa
//
//  Created by Samroz Javed on 02/08/2022.
//

import Foundation
import MapKit

struct animalLocation: Codable, Identifiable {
    var id: String
    var name: String
    var latitude: Double
    var longitude: Double
    var image: String
    
    //Reusable property
    var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
