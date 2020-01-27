//
//  LocationWeatherDetailsInteractor.swift
//  WeatherAssignment
//
//  Created by Nikhil d on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
class LocationWeatherDetailsInteractor: LocationWeatherDetailInputInteractorProtocol {

    var presenter: LocationWeatherDetailPresenterProtocol?
    func fetchWeatherDetails(locationItem: LocationItem) {
        let networkSession = NetworkSession(completionBlock: {(data) in
            
        }, errorBlock: {(error )
            in
            
        }, cancelBlock: nil)
        if let location = locationItem.location {
            let getURLString = NetworkConstant.baseURL+NetworkConstant.latitude+"\(location.coordinate.latitude)&"

        }
    }
    
    
    
}
extension LocationWeatherDetailsInteractor:LocationWeatherDetailOutputInteractorProtocol{
    func didFetchWeatherFor(location: LocationItem) {
        
    }

    
}
 
