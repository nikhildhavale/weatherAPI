//
//  LocationItem.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 26/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
import CoreLocation
class LocationItem {
    var location:CLLocation?
    var name:String?
    var weatherInfo:WeatherDetailsResponse?
    init(location:CLLocation,name:String) {
        self.location = location
        self.name = name
    }
    func getImageId() -> String?{
        if let weather = weatherInfo?.list?.first?.weather?.first {
           return weather.icon
        }
        return nil;
    }
}
