//
//  Constant.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 26/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
import CoreLocation
struct WeatherUIConstant {
    static let cellIdentifier = "weatherCell"
    static let defaultWeathLocation = CLLocation(latitude: 18.516, longitude: 73.856)
    static let weatherDetailsSegue = "weatherDetailsSegue"
    static let LocationViewCellCollectionViewCell = "LocationViewCellCollectionViewCell"
}
struct NetworkConstant{
    static let baseURL = "http://api.openweathermap.org/data/2.5/weather?"
    static let appid =  "APPID=ee4096f5d1aef5b2a6bd7b46209b75b7"
    static let latitude = "lat="
    static let longitiude = "long="
}
