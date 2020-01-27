//
//  LocationWeatherDetailsInteractor.swift
//  WeatherAssignment
//
//  Created by Nikhil d on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
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
 
