//
//  LocationWeatherDetailsInteractor.swift
//  WeatherAssignment
//
//  Created by Nikhil d on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
class WeatherDetailsResponse:Codable {
    var list:[ForecastResponse]?
    var id:Int64?
    var name:String?
    var cod:String?
    
}
class ForecastResponse:Codable{
    var dt:Int64?
    var temp:TemperatureResponse?
    var weather:[WeatherResponse]?
    var main:MainWeatherResponse?
    var clouds:CloudReponse?
    var wind:WindResponse?
    var rain:RainReponse?
}
class TemperatureResponse:Codable {
    var day:Float?
    var min:Float?
    var max:Float?
    var night:Float?
    var eve:Float?
    var mom:Float?
    var pressure:Float?
    var humdity:Int
    
}

class WeatherResponse:Codable {
    var id:Int?
    var main:String?
    var description:String?
    var icon:String
}

 class MainWeatherResponse: Codable {
     var temp:Float?
     var feelsLike:Float?
     var minTemp:Float?
     var maxTemp:Float?
     var pressure:Int?
     var humidity:Int?
     private enum CodingKeys :String, CodingKey {
         case temp
         case feelsLike = "feels_like"
         case minTemp = "temp_min"
         case maxTemp = "temp_max"
         case pressure = "pressure"
         case humidity
     }
     
 }
 
 class WindResponse:Codable{
    var speed:Float?
    var deg:Float?
}
class CloudReponse:Codable {
    var all:Int?
}
class RainReponse:Codable {
    var rain:Float?
     private enum CodingKeys :String, CodingKey {
       case rain = "3h"
    }
}
/*
class SunRiseReponse:Codable{
    var type:Int?
    var id:Int64?
    var message:Float?
    var country:String?
    var sunrise:Int64?
    var sunset:Int64?
}*/
class LocationWeatherDetailsInteractor: LocationWeatherDetailInputInteractorProtocol {
    var networkSession:NetworkSession?
    var presenter: LocationWeatherDetailPresenterProtocol?
    func fetchWeatherDetails(locationItem: LocationItem) {
        
        if let locationName = locationItem.name {
            let getURLString = NetworkConstant.baseURL+NetworkConstant.forecast+NetworkConstant.query+locationName+"&"+NetworkConstant.appid
                networkSession = NetworkSession(completionBlock: {(data) in
                    self.parseWeatherDetails(data: data, location: locationItem)
                   
                }, errorBlock: {(error) in
                
                }, cancelBlock: {
                    
                })
            networkSession?.setupGetRequest(urlString: getURLString)
        }
    }
    func parseWeatherDetails(data:Data,location:LocationItem){
        do {
            let jsonDecoder = JSONDecoder()
            let response = try jsonDecoder.decode(WeatherDetailsResponse.self, from: data)
            location.weatherInfo = response
            DispatchQueue.main.async {
                self.didFetchWeatherFor(location: location)

            }
        }
        catch{
            print(error)
        }
    }
    
    
}
extension LocationWeatherDetailsInteractor:LocationWeatherDetailOutputInteractorProtocol{
    func didFetchWeatherFor(location: LocationItem) {
        presenter?.view?.showLocationWeatherDetail(with: location)
    }

    
}
 
