//
//  Landmark.swift
//  LandmarksUITests
//
//  Created by Steve Handy on 2024.04.30.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable { // Codable to move data between structure and data file
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D { // interacts with MapKit
        CLLocationCoordinate2D(
            latitude: coordinates.latitude, 
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
