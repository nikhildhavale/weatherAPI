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
    
    
    
}
extension LocationWeatherDetailsInteractor:LocationWeatherDetailOutputInteractorProtocol{
    func didFetchWeatherFor(location: LocationItem) {
        
    }

    
}
 
