//
//  HomeVM.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/4/21.
//

import Foundation
import CoreLocation

class HomeVM {
    
    public var isInSheet: Bool = true
    
    public func validateCheckIn(current currentLocation: CLLocationCoordinate2D, completion: @escaping((Bool, CLLocationCoordinate2D?) -> Void)) {
        self.getDataCheckIn { (location) in
            if let location = location {
                let contain = location.getRegion().contains(currentLocation)
                if contain {
                    completion(true, currentLocation)
                } else {
                    completion(false, nil)
                }
            } else {
                completion(false, nil)
            }
        }
    }
    
    private func getDataCheckIn(completion: @escaping((LocationModel?) -> Void)) {
        Utils.readFileJson(fileName: "location") { (dict) in
            let response = ResponseModel(dict: dict)
            if let data = response.data {
                let location = LocationModel(dict: data)
                completion(location)
            } else {
                completion(nil)
            }
        }
    }
}
