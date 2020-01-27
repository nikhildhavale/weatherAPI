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
    func getPressure() -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()
        if let pressure = getTodayForecast()?.main?.pressure{
            attributedString.append(NSAttributedString(string: "\(pressure) hPa", attributes: FontConstant.valueFont))
            attributedString.append(NSAttributedString(string: "\nPressure", attributes: FontConstant.titleFont))
        }
        return attributedString
    }
    func getHumidity() -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()
        if let humidity = getTodayForecast()?.main?.humidity{
            attributedString.append(NSAttributedString(string: "\(humidity) %", attributes: FontConstant.valueFont))
            attributedString.append(NSAttributedString(string: "\nHumidity", attributes: FontConstant.titleFont))
        }
        return attributedString
    }
    func getWind() -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()
        if let wind = getTodayForecast()?.wind?.speed{
            attributedString.append(NSAttributedString(string: "\(wind) m/s", attributes: FontConstant.valueFont))
            attributedString.append(NSAttributedString(string: "\nWind", attributes: FontConstant.titleFont))
        }
        return attributedString
    }
}
