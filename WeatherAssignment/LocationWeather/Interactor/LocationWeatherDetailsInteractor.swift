//
//  LocationWeatherDetailsInteractor.swift
//  WeatherAssignment
//
//  Created by Nikhil d on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
class WeatherDetailsResponse:Codable {
    var weather:[WeatherResponse]?
    var base:String?
    var main:MainWeatherResponse?
    var wind:WindResponse?
    var clouds:CloudReponse?
    var dt:Int64?
    var sys:SunRiseReponse?
    var timezone:Int64?
    var id:Int64?
    var name:String?
    var cod:Int
    
}
class MainWeatherResponse: Codable {
    var temp:Float?
    var feelsLike:Float?
    var minTemp:Float?
    var maxTemp:Float?
    var pressure:Int?
    var humidty:Int?
    private enum CodingKeys :String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
        case pressure = "pressure"
        case humidty
    }
    
}
class WeatherResponse:Codable {
    var id:Int?
    var main:String?
    var description:String?
    var icon:String
}
class WindResponse:Codable{
    var speed:Float?
    var deg:Float?
}
class CloudReponse:Codable {
    var all:Int?
}
class SunRiseReponse:Codable{
    var type:Int?
    var id:Int64?
    var message:Float?
    var country:String?
    var sunrise:Int64?
    var sunset:Int64?
}
class LocationWeatherDetailsInteractor: LocationWeatherDetailInputInteractorProtocol {
    var networkSession:NetworkSession?
    var presenter: LocationWeatherDetailPresenterProtocol?
    func fetchWeatherDetails(locationItem: LocationItem) {
    
        if let locationName = locationItem.name {
            let getURLString = NetworkConstant.baseURL+NetworkConstant.query+locationName+"&"+NetworkConstant.appid
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
             self.didFetchWeatherFor(location: location)
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
 
