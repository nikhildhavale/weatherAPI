//
//  LocationWeatherDetailsPresent.swift
//  WeatherAssignment
//
//  Created by Nikhil d on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
import UIKit
class LocationWeatherDetailsPresenter:LocationWeatherDetailPresenterProtocol {
    var wireframe: LocationWeatherDetailWireFrameProtocol?
    
    var interactor: LocationWeatherDetailInputInteractorProtocol?
    var view: LocationWeatherDetailViewProtocol?
    
    func viewDidLoad() {
       
    }
    func fetchWeatherDetails(locationItem: LocationItem) {
        interactor?.fetchWeatherDetails(locationItem: locationItem)
    }
    
}
