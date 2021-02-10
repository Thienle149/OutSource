//
//  LocationModel.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/4/21.
//

import Foundation
import CoreLocation

class LocationModel {
    var longitude: Double!
    var latitude: Double!
    var radius: Double!
    
    init(dict: [String: Any]) {
        self.longitude = dict["longitude"] as? Double ?? 0
        self.latitude = dict["latitude"] as? Double ?? 0
        self.radius = dict["radius"] as? Double ?? 0
    }
    
    public func getRegion() -> CLCircularRegion {
        let center = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        let radius: CLLocationDistance = self.radius   // meters
        return CLCircularRegion(center: center, radius: radius, identifier: "CircularRegion")
    }
}
