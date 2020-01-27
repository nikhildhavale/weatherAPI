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
    static let defaultLocationString = "Pune"
}
struct NetworkConstant{
    static let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
    static let appid =  "appid=de37bb6f21b34a04b8bd1dbca6fa8ee0"
    static let latitude = "lat="
    static let longitiude = "long="
    static let query = "q="
}
