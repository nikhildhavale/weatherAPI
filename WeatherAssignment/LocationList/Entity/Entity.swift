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
    func getTodayImageId() -> String?{
        if let forecast = getTodayForecast() {
            return forecast.weather?.first?.icon
        }
        return nil;
    }
    func getTodayForecast() -> ForecastResponse?{
        return weatherInfo?.list?.filter{
            if let dateInt = $0.dt{
                let date = Date(timeIntervalSince1970: TimeInterval(dateInt))
                return Calendar.current.isDateInToday(date)
            }
            return false
            
        }.first
        
    }
    func getCurrentTemperature() -> String?{
        if let temp = getTodayForecast()?.main?.temp{
            return "\(temp) \u{00B0}C"
        }
        return nil
    }
}
