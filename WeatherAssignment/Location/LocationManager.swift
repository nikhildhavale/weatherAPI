//
//  LocationManager.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 26/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
import CoreLocation
class LocationManager:NSObject,CLLocationManagerDelegate {
    static let shared = LocationManager()
    let manager = CLLocationManager()
    var currentLocation = WeatherUIConstant.defaultWeathLocation
    var currentLocationItem = LocationItem(location: WeatherUIConstant.defaultWeathLocation, name: WeatherUIConstant.defaultLocationString)
    override init() {
        manager.requestWhenInUseAuthorization()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.first ?? WeatherUIConstant.defaultWeathLocation
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(currentLocation, completionHandler:{(placemarks,error)
            in
            if let placemark = placemarks?.first , let locality = placemark.locality{
                self.currentLocationItem = LocationItem(location: self.currentLocation, name: locality )
            }
        } )
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
